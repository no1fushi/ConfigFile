var gulp = require('gulp');
var gutil = require('gulp-util');
var ftp = require('vinyl-ftp');
var gulp = require('gulp');
var browserSync = require('browser-sync').create();

//ftp
var conn_config = {
  host: 'hostname',
  user: 'username',
  password: 'password',
  parallel: 5,
  log: gutil.log
}
var remoteDest = '/';
var globs = [
  'uploadpath',
];

gulp.task('deploy', function(){
  var conn = ftp.create(conn_config);
  gulp.src(globs, {buffer: false, dot: true})
    .pipe(conn.newerOrDifferentSize(remoteDest))
    .pipe(conn.dest(remoteDest));
});

//liveload
gulp.task('browser-sync', function() {
    browserSync.init({
        server: {
            baseDir: "src"
        }
    });
});
 
gulp.task('bs-reload', function () {
    browserSync.reload();
});

gulp.task('default', ['browser-sync'], function () {
    gulp.watch("src", ['bs-reload']);
});
