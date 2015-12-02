/*jslint vars: true, plusplus: true, devel: true, nomen: true, indent: 4 */
/*global define, $, brackets, document, setTimeout */
define(function (require, exports) {
    "use strict";
    var EditorManager   = brackets.getModule("editor/EditorManager"),
    	Editor			= brackets.getModule("editor/Editor"),
		prefs = require('./preferences'),
		MAIN = require('../main'),
		$root,
		$content,
		$footerOutline,
		_document,
		sortMode = 'none',
		newDocFlag = true,
		outlines = {
			'html' : require('./outlines/html'),
			'less' : require('./outlines/less'),
			'scss' : require('./outlines/scss'),
			'javascript' : require('./outlines/js/js'),
			'python' : require('./outlines/python'),
			'php' : require('./outlines/php'),
		};
		outlines.css = outlines.less;

	prefs.onChange(function(path) {
		if (path === 'outline/fontSize') {
			MAIN.changeTab('outline');
			updateCss();
		}
	});
	/** create dom tree
	 *	@param {object} dataTree
	 */
	function updateTree(dataTree) {
		$root.html('');
		var recursive = function (node) {
			var html = '',
				dataDash = '',
				name,
				typeStr = '';

			//create data attribs
			for(name in node) {
				if (name === 'line' || name === 'line') { continue; }
				if (typeof node[name] === 'string' || typeof node[name] === 'number') {
					dataDash += 'data-' + name + '="' + node[name] + '" ';
				} else if (node[name] instanceof Array) {
					//dataDash += 'data-' + name + '="' + JSON.stringify(node[name]) + '" ';
				}
			}
			//open new li and add data-dashes
			var toggleCss = 'toggle';
			if (node.childs && node.childs.length === 0) {
				toggleCss += ' no-childs';
			}
			if (node.type) {
				//typeStr = '<span class="typeImage ' + node.type + '"></span>';
			}
			html += '<li ' + dataDash + '><div class="' + toggleCss + '">&nbsp;</div>' + typeStr + '<span class="line">' + node.line + '</span><ul class="childs">';

			//iterate over childs
			for (var i=0;i<node.childs.length;i++) {
				html += recursive(node.childs[i]);
			}
			//close ul li
			html += '</ul></li>';
			return html;
		};
		var re = '';
		for (var i=0;i<dataTree.childs.length;i++) {
			re += recursive(dataTree.childs[i]);
		}
		appendStringAsNodes($root[0], re);
		sort($content);
	}
	function appendStringAsNodes() {
		/* jslint ignore:start */
		var frag = document.createDocumentFragment(),
			element = arguments[0],
			html = arguments[1],
			tmp = document.createElement('body'),
			child;

		tmp.innerHTML = html;

		while (child = tmp.firstChild) {
			frag.appendChild(child);
		}
		element.appendChild(frag); // Now, append all elements at once
		frag = tmp = null;
		/* jslint ignore:end */
	}
	function sort($parent, mode) {
		var $list = $parent.children('ul').children('li'),
			list = $list.get(),
			i;

		if (typeof mode === 'string') {
			sortMode = mode;
		}
		var sort_by_name = function(a, b) {
			var sa = a.dataset.name,
				sb = b.dataset.name;
			return sa.toLowerCase().localeCompare(sb.toLowerCase());
		};

		var sort_by_line = function(a, b) {
			var sa = parseInt(a.dataset.startline),
				sb = parseInt(b.dataset.startline);
			return (sa > sb)? 1 : -1;
		};
//		var sort_by_line_down = function(a, b) {
//			var sa = parseInt(a.dataset['startline']),
//				sb = parseInt(b.dataset['startline']);
//			return (sa > sb)? false : true;
//		};
		if (sortMode === 'none') {
			list.sort(sort_by_line);
		} else if (sortMode === 'asc') {
			list.sort(sort_by_name);
		}
		for (i = 0; i < list.length; i++) {
			list[i].parentNode.appendChild(list[i]);
		}
		$list.each(function() {
			if ($(this).children('ul').children('li').length >= 0) {
				sort($(this));
			}
		});
	}
	/** center line and set cursor at line
	 *	@param {number} line
	 */
	function setEditorLine(line, char) {
		if (typeof char !== 'number') {
			char = 0;
		}
		var currentEditor = EditorManager.getCurrentFullEditor();
        currentEditor.setCursorPos(line - 1, char, true);
        currentEditor.focus();
	}
	/** registers an button on the bottom of the outline viewer
	 *	@param {string} outlineName
	 *	@param {string} name used as class
	 *	@param {function} callBack function
	 */
	function registerButton(outlineName, buttonName, callBack) {
		//build html, add click event
		var $button = $('<span class="button ' + buttonName + '"></span>');
		$footerOutline.append($button);
		$button.click(function(e) {
			callBack(e);
		});
	}
	function updateCss () {
		var rules,
			i = document.styleSheets.length-1;

		//search right css file
		for (i;i>-1;i--) {
			if (typeof document.styleSheets[i].href === 'string' && document.styleSheets[i].href.slice(-13) === 'blueprint.css') {
				rules = document.styleSheets[i].rules;
				break;
			}
		}
		if (!rules) {
			return false;
		}

		//search selectors to change and change
		for (i=0;i<rules.length;i++) {
			switch (rules[i].selectorText) {
				case '#blueprint-outliner .outline-root li .line':
					//fontSize
					var fontSize = prefs.get('outline/fontSize');
					rules[i].style.fontSize = fontSize + 'px';
//					rules[i].style.lineHeight = (fontSize + 5) + 'px';
					break;
				case '':
					break;
				case '':
					break;
				case '':
					break;
				case '':
					break;
			}
		}
	}
	function updateOutlineRootType(type) {
		$root.attr('type', type);
	}
	function forceUpdate() {
		var id = _document.getLanguage()._id,
			source = _document.getText();
		if (id in outlines) {
			outlines[id].update(source, updateTree);
			updateOutlineRootType(id);
		} else {
				$root.html('can\'t display "' + id + '"');
				return false;
		}
		return true;
	}
	exports.init = function($parent) {
		var name;

		$root = $parent;
		$content = $root.parent('.content');

		$parent.append('<div>outliner</div>');

		$footerOutline = $('<div class="outline-buttons"><span class="button sort" title="Switch sort mode"></span></div>');
		$content.parent().children('.footer').append($footerOutline);

		//events
        $($root).on('click', '.line', function () {
			var line = this.parentNode.dataset.startline,
				char = this.parentNode.dataset.startchar;

			if (line === '') {
				return;
			}
			setEditorLine(parseInt(line), parseInt(char));
		});
		$($root).on('click', '.toggle', function (e) {
			//hide/show
			if ($(e.target).hasClass('colapsed')) {
				$(e.target).removeClass('colapsed');
			} else {
				$(e.target).addClass('colapsed');
			}
			var $parent = $(e.target).parent('li');
			$parent.children('.childs').toggle();
		});

      $('.sort', $footerOutline).click(function () {
			if (sortMode === 'none') {
				sort($content, 'asc');
			} else if (sortMode === 'asc') {
				sort($content, 'none');
			}
		});

		//init outlines
		for(name in outlines) {
			/* jslint ignore:start */
			outlines[name].init({
				getTabSize : function () {
					if (_document) {
						return Editor.Editor.getTabSize(_document.file._path);
					}
				},
				setEditorLine : setEditorLine,
				render : updateTree,
				registerButton : function (buttonName, callBack) {
					registerButton(name, buttonName, callBack);
				}
			}, $root);
			/* jslint ignore:end */
		}

		setTimeout(function() { updateCss(); }, 300);
		setTimeout(function() { updateCss(); }, 500);
		setTimeout(function() { updateCss(); }, 700);
	};
	exports.update = function (doc) {
		if (!doc) {
			//clear
			$root.html('');
			_document = null;
			return true;
		}

		newDocFlag = (_document == doc)? false: true;
		_document = doc;

		if (newDocFlag) {
			sortMode = prefs.get('outline/defaultSorting');
		}
		return forceUpdate();
	};
	exports.setViewState = function (state) {
		if (state) {
			$footerOutline.show();
		} else {
			$footerOutline.hide();
		}
	};

});
