define(function (require, exports) {
    "use strict";

    // Brackets modules
    var _               = brackets.getModule("thirdparty/lodash"),
        Dialogs         = brackets.getModule("widgets/Dialogs"),
        DefaultDialogs  = brackets.getModule("widgets/DefaultDialogs"),
        NativeApp       = brackets.getModule("utils/NativeApp");

    // Local modules
    var ErrorHandler  = require("src/ErrorHandler"),
        Preferences   = require("src/Preferences"),
        Promise       = require("bluebird"),
        Snippet       = require("src/Snippet"),
        Snippets      = require("src/Snippets"),
        Strings       = require("strings");

    // Constants
    var DEFAULT_GIST_DESCRIPTION  = "My code snippets for Brackets (created using https://github.com/zaggino/brackets-snippets)",
        GITHUB_API_SERVER         = "https://api.github.com";

    // Variables
    var githubToken;

    function _authorize() {
        githubToken = Preferences.get("githubToken");
        if (!githubToken) {
            ErrorHandler.show(Strings.ERROR_TOKEN_REQUIRED);
            return false;
        }
        return true;
    }

    function _findGist() {
        var defer = Promise.defer();

        $.ajax({
            url: GITHUB_API_SERVER + "/gists",
            type: "GET",
            dataType: "json",
            cache: false,
            headers: {
                "Authorization": "token " + githubToken
            }
        })
        .done(function (data) {

            var found = _.find(data, function (gist) {
                return gist.description === DEFAULT_GIST_DESCRIPTION;
            });
            defer.resolve(found);

        })
        .fail(function (err, errdesc, statusText) {
            ErrorHandler.show(err.responseText, statusText);
            defer.reject(err);
        });

        return defer.promise;
    }

    function _updateGist(existingGist) {
        var defer = Promise.defer();

        var payload = {
            "description": DEFAULT_GIST_DESCRIPTION,
            "public": true,
            "files": {
                // "file1.txt": {
                //    "content": "String file contents"
                // }
            }
        };

        var url = GITHUB_API_SERVER + "/gists",
            type = "POST";

        if (existingGist) {
            url = existingGist.url;
            type = "PATCH";
            // mark all files to be deleted
            Object.keys(existingGist.files).forEach(function (file) {
                payload.files[file] = null;
            });
        }

        var snippets = Snippets.getAll();
        snippets.forEach(function (snippet) {
            payload.files[snippet.name] = {
                content: snippet.template
            };
        });

        $.ajax({
            url: url,
            type: type,
            dataType: "json",
            cache: false,
            data: JSON.stringify(payload),
            headers: {
                "Authorization": "token " + githubToken
            }
        })
        .done(function (data) {
            /*jshint -W106*/
            NativeApp.openURLInDefaultBrowser(data.html_url);
            /*jshint +W106*/
            defer.resolve(data);
        })
        .fail(function (err, errdesc, statusText) {
            ErrorHandler.show(err.responseText, statusText);
            defer.reject(err);
        });

        return defer.promise;
    }

    function _parseSnippetsFromGist(gist) {
        return Object.keys(gist.files).map(function (name) {
            return {
                name: name,
                template: gist.files[name].content
            };
        });
    }

    function _downloadGist(url) {
        var defer = Promise.defer();

        $.ajax({
            url: url,
            type: "GET",
            dataType: "json",
            cache: false,
            headers: {
                "Authorization": "token " + githubToken
            }
        })
        .done(function (data) {
            if (Array.isArray(data)) {

                var snippets = [],
                    finish = _.after(data.length, function () {
                        defer.resolve(snippets);
                    });

                data.forEach(function (d) {
                    _downloadGist(d.url).then(function (s) {
                        snippets = snippets.concat(s);
                        finish();
                    });
                });

            } else {
                defer.resolve(_parseSnippetsFromGist(data));
            }
        })
        .fail(function (err, errdesc, statusText) {
            ErrorHandler.show(err.responseText, statusText);
            defer.reject(err);
        });

        return defer.promise;
    }

    function _parseGistId(url) {
        var m = url.match(/gist\.github\.com\/([a-zA-Z0-9]+)\/([a-zA-Z0-9]+)/);
        return (m && m[2] !== "public") ? m[2] : null;
    }

    function _parseGistUser(url) {
        var m = url.match(/gist\.github\.com\/([a-zA-Z0-9]+)/);
        return m ? m[1] : null;
    }

    function downloadInfo(url) {
        var defer = Promise.defer();

        if (!_authorize()) {
            defer.reject();
        }

        var gistId = _parseGistId(url);
        if (gistId) {
            _downloadGist(GITHUB_API_SERVER + "/gists/" + gistId).then(function (objs) {
                defer.resolve(objs);
            });
        } else {
            ErrorHandler.show("No id found in URL: " + url);
            defer.reject();
        }

        return defer.promise;
    }

    function downloadAll(url, options) {
        var defer = Promise.defer();

        if (!_authorize()) {
            defer.reject();
        }

        var finish = function (url) {
            _downloadGist(url)
                .then(function (objs) {

                    var newSnippets = [];

                    // dispose of old snippets
                    if (options.deleteLocal) {
                        Snippets.clearAll();
                    }

                    // create new snippets
                    var promises = objs.map(function (obj) {
                        return Snippet.create(obj.name, obj.template).then(function (snippet) {
                            Snippets.addToCollection(snippet);
                            newSnippets.push(snippet);
                        });
                    });

                    Promise.all(promises).then(function () {

                        // show dialog about success
                        Dialogs.showModalDialog(
                            DefaultDialogs.DIALOG_ID_INFO,
                            Strings.IMPORT_FROM_GIST,
                            Strings.IMPORT_SUCCESSFUL
                        );

                        defer.resolve(newSnippets);

                    });
                })
                .catch(function () {
                    defer.reject();
                });
        };

        if (url) {
            // should be able to handle:
            // https://gist.github.com/zaggino/61ae7090b1d9e67ea013
            // https://gist.github.com/zaggino/public
            // https://gist.github.com/zaggino
            var gistId = _parseGistId(url);
            if (gistId) {
                finish(GITHUB_API_SERVER + "/gists/" + gistId);
            } else {
                var gistUser = _parseGistUser(url);
                if (gistUser) {
                    finish(GITHUB_API_SERVER + "/users/" + gistUser + "/gists");
                } else {
                    ErrorHandler.show("Can't download gists from URL: " + url);
                    defer.reject();
                }
            }

        } else {
            _findGist().then(function (found) {

                if (found) {
                    finish(found.url);
                } else {
                    ErrorHandler.show(Strings.ERROR_DEFAULT_GIST_NOTFOUND);
                    defer.reject();
                }

            }).catch(function () {
                defer.reject();
            });
        }

        return defer.promise;
    }

    function uploadAll() {
        if (!_authorize()) {
            return Promise.reject();
        }
        return _findGist()
            .then(function (found) {
                return _updateGist(found);
            });
    }

    exports.downloadInfo  = downloadInfo;
    exports.downloadAll   = downloadAll;
    exports.uploadAll     = uploadAll;

});
