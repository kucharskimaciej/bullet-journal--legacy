gulp = require 'gulp'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
html2js = require 'gulp-ng-html2js'
jade = require 'gulp-jade'
sourcemaps = require 'gulp-sourcemaps'
bowerFiles = require 'main-bower-files'
uglify = require 'gulp-uglify'
ngmin = require 'gulp-ngmin'
less = require 'gulp-less'
LessCleanCss = require 'less-plugin-clean-css'


paths =
  templatesSrc: 'static/src/**/*.tpl.jade'
  appSrc: ['static/src/modules.coffee', 'static/src/**/*.coffee']
  libSrc: 'bower_components'
  lessSrc: 'static/less/*.less'
  dist: 'static/dist'

gulp.task 'compile-templates', ->
  gulp.src paths.templatesSrc
    .pipe jade()
    .pipe html2js moduleName: 'templates', declareModule: no
    .pipe concat('templates.js')
    .pipe ngmin()
    .pipe uglify()
    .pipe gulp.dest paths.dist

gulp.task 'build-libs', ->
  gulp.src bowerFiles()
    .pipe concat('libs.js')
    .pipe ngmin()
    .pipe uglify()
    .pipe gulp.dest paths.dist


gulp.task 'build-src', ->
  gulp.src paths.appSrc
    .pipe sourcemaps.init()
    .pipe coffee(bare: yes)
    .pipe concat('app.js')
    .pipe ngmin()
    .pipe uglify()
    .pipe sourcemaps.write()
    .pipe gulp.dest paths.dist

gulp.task 'build-less', ->
  gulp.src paths.lessSrc
    .pipe less plugins: [new LessCleanCss(advanced: yes)]
    .pipe gulp.dest paths.dist

gulp.task 'watch', ->
  gulp.watch paths.templatesSrc, ['compile-templates']
  gulp.watch paths.libSrc, ['build-libs']
  gulp.watch paths.appSrc, ['build-src']
  gulp.watch paths.lessSrc, ['build-less']

gulp.task 'build', ['build-libs', 'compile-templates', 'build-src', 'build-less']