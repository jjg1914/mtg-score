http              = require "http"
connect           = require "connect"
morgan            = require "morgan"
connectLivereload = require "connect-livereload"
serveStatic       = require "serve-static"
livereload        = require "livereload"

app = connect()

app.use morgan "dev"
app.use connectLivereload()
app.use "/bower_components", serveStatic "bower_components"
app.use serveStatic "public"

http.createServer(app).listen 8080

livereload.createServer().watch __dirname + "/public"
