// gulpfile.js
const gulp = require('gulp');
const cleanCSS = require('gulp-clean-css');
const concat = require('gulp-concat');
const rename = require('gulp-rename');

// Define tasks
gulp.task('styles', function() {
  return gulp.src('src/css/*.css') // Source folder
    .pipe(concat('styles.css'))   // Concatenate files
    .pipe(cleanCSS())             // Minify CSS
    .pipe(rename({ suffix: '.min' })) // Rename file
    .pipe(gulp.dest('dist/css'));  // Destination folder
});

gulp.task('scripts', function() {
  return gulp.src('src/js/*.js')   // Source folder
    .pipe(concat('scripts.js'))   // Concatenate files
    .pipe(gulp.dest('dist/js'));  // Destination folder
});

// Build task
gulp.task('build', gulp.series('styles', 'scripts'));

// Default task
gulp.task('default', gulp.series('build'));
