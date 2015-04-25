childProcess    = require "child_process"
gulp            = require "gulp"
plugins         = require("gulp-load-plugins")()
es              = require "event-stream"
mainBowerFiles  = require "main-bower-files"

require("dotenv").load()
process.env.NODE_ENV ?= "production"

gulp.task "default", [ "server", "watch" ]

gulp.task "server", [
    ( if process.env.NODE_ENV == "development" then "build" else "manifest" )
  ], (done) ->

  require "./index"
  process.on "SIGINT", ->
    done()
    process.exit()

gulp.task "build", ->
  tplFilter = plugins.filter "**/*.tpl.jade"
  coffeeFilter = plugins.filter "**/*.coffee"

  isDevelopment = process.env.NODE_ENV == "development"

  gulp.src [ "src/**/*.jade", "!src/**/*.tpl.jade" ]
    .pipe plugins.plumber()
    .pipe plugins.inject es.merge([
      gulp.src mainBowerFiles(), read: false
      gulp.src [ "src/**/*.coffee", "src/**/*.tpl.jade" ]
        .pipe plugins.plumber()
        .pipe plugins.sourcemaps.init()
        .pipe tplFilter
        .pipe plugins.jade()
        .pipe plugins.angularTemplatecache module: "mtg"
        .pipe tplFilter.restore()
        .pipe coffeeFilter
        .pipe plugins.coffee()
        .pipe coffeeFilter.restore()
        .pipe plugins.angularFilesort()
        .pipe plugins.if not isDevelopment, plugins.ngAnnotate()
        .pipe plugins.if not isDevelopment, plugins.concat "index.js"
        .pipe plugins.if not isDevelopment, plugins.uglify()
        .pipe plugins.if not isDevelopment, plugins.rename suffix: ".min"
        .pipe plugins.sourcemaps.write "."
        .pipe gulp.dest "public"
      gulp.src "src/**/*.sass"
        .pipe plugins.plumber()
        .pipe plugins.sourcemaps.init()
        .pipe plugins.sass indentedSyntax: true
        .pipe plugins.autoprefixer()
        .pipe plugins.if not isDevelopment, plugins.concat "index.css"
        .pipe plugins.if not isDevelopment, plugins.cssmin()
        .pipe plugins.if not isDevelopment, plugins.rename suffix: ".min"
        .pipe plugins.sourcemaps.write "."
        .pipe gulp.dest "public"
      gulp.src "src/**/*.yaml"
        .pipe plugins.plumber()
        .pipe plugins.yaml(space: if isDevelopment then 2 else null)
        .pipe gulp.dest "public"
    ]), ignorePath: "public", addRootSlash: false
    .pipe plugins.jade pretty: isDevelopment
    .pipe gulp.dest "public"

gulp.task "bower", ->
  gulp.src mainBowerFiles(), base: "."
    .pipe gulp.dest "public"

gulp.task "assets", ->
  gulp.src "assets/**/*"
    .pipe gulp.dest "public"

gulp.task "manifest", [ "build", "bower", "assets" ], ->
  gulp.src "public/**/*"
    .pipe plugins.manifest
      hash: true
      filename: "mtg.appcache"
      exclude: "mtg.appcache"
    .pipe gulp.dest "public"

gulp.task "deploy", [ "manifest" ], ->
  gulp.src "public/**/*"
    .pipe plugins.ghPages()

gulp.task "watch", ->
  plugins.watch "./src/**/*", plugins.batch (e,cb) ->
    gulp.start "build"
    cb()

gulp.task "clean", (done) ->
  childProcess.exec "rm -rf public", done
