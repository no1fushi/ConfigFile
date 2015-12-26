var gulp = require("gulp");
var sass = require("gulp-sass");
var autoprefixer = require("gulp-autoprefixer");
var browser = require("browser-sync");
var htmlhint = require("gulp-htmlhint");
var csslint = require('gulp-csslint');
var notify = require('gulp-notify');





















var plumber = require("gulp-plumber");
 

gulp.task("server", function() {
    browser({
        server: {
            baseDir: "./"
        }
    });
});

gulp.task("sass", function() {
    gulp.src("sass/**/.scssÅh,"!sass/sample/**/*.scss")
        .pipe(sass())
	.pipe(autoprefixer())
        .pipe(gulp.dest("./css"));
        .pipe(plumber({errorHandler: notify.onError('<%= error.message %>')} ))
        .pipe(frontnote())
	.pipe(browser.reload({stream:true}))
});

gulp.task("html", function() {
    gulp.src('*.html')
        .pipe(htmlhint())
	.pipe(plumber({errorHandler: notify.onError('<%= error.message %>')} ))
        .pipe(htmlhint.reporter())
});

gulp.task("css", function() {
    gulp.src('cmn/css/*.css')
    	.pipe(csslint())
    	.pipe(csslint.reporter());
	.pipe(plumber({errorHandler: notify.onError('<%= error.message %>')} ))
});

gulp.task("default",['server'], function() {
	gulp.watch("*.html"["html"]);
	gulp.watch("*.css"["css"]);
	gulp.watch("sass/**/*.scss",["sass"]);
});
