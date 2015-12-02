define(function (require, exports, module) {

    // Brackets modules
    var AppInit         = brackets.getModule("utils/AppInit"),
        ExtensionUtils  = brackets.getModule("utils/ExtensionUtils");

    // Local modules
    var Promise       = require("bluebird"),
        SnippetWidget = require("src/SnippetWidget"),
        Snippets      = require("src/Snippets");

    // Load CodeMirror runMode
    brackets.getModule(["thirdparty/CodeMirror2/addon/runmode/runmode"], $.noop, function (err) {
        console.error(err);
    });

    // Bluebird config
    Promise.onPossiblyUnhandledRejection(function (e/*, promise*/) {
        if (e != null) { throw e; }
    });

    // Extension initialisation
    AppInit.appReady(function () {
        // Load the style sheet
        ExtensionUtils.loadStyleSheet(module, "styles/main.less");
        // Init the extension modules
        SnippetWidget.init();
        Snippets.init();
    });

});
