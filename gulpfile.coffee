childProcess    = require "child_process"
gulp            = require "gulp"
plugins         = require("gulp-load-plugins")()
es              = require "event-stream"
mainBowerFiles  = require "main-bower-files"

gulp.task "default", [ "server", "watch" ]

gulp.task "server", [ "build" ], (done) ->
  require "./index"
  process.on "SIGINT", ->
    done()
    process.exit()

gulp.task "build", ->
  tplFilter = plugins.filter "**/*.tpl.jade"
  coffeeFilter = plugins.filter "**/*.coffee"

  gulp.src [ "src/**/*.jade", "!src/**/*.tpl.jade" ]
    .pipe plugins.plumber()
    .pipe plugins.inject es.merge([
      gulp.src mainBowerFiles()
      gulp.src [ "src/**/*.coffee", "src/**/*.tpl.jade" ]
        .pipe plugins.plumber()
        .pipe plugins.sourcemaps.init()
        .pipe tplFilter
        .pipe plugins.jade()
        .pipe plugins.angularTemplatecache module: "app"
        .pipe tplFilter.restore()
        .pipe coffeeFilter
        .pipe plugins.coffee()
        .pipe coffeeFilter.restore()
        .pipe plugins.angularFilesort()
        .pipe plugins.sourcemaps.write "."
        .pipe gulp.dest "public"
      gulp.src "src/**/*.sass"
        .pipe plugins.plumber()
        .pipe plugins.sourcemaps.init()
        .pipe plugins.sass indentedSyntax: true
        .pipe plugins.autoprefixer()
        .pipe plugins.sourcemaps.write "."
        .pipe gulp.dest "public"
    ]), ignorePath: "public", addRootSlash: false
    .pipe plugins.jade pretty: true
    .pipe gulp.dest "public"

gulp.task "watch", ->
  plugins.watch "./src/**/*", plugins.batch (e,cb) ->
    gulp.start "build"
    cb()

gulp.task "clean", (done) ->
  childProcess.exec "rm -rf public", done
  
