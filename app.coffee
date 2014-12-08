express = require 'express'
methodOverride = require 'method-override'
app = express()

allowCrossDomain = (req, res, next) ->
  res.header('Access-Control-Allow-Origin', '')
  res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE')
  res.header('Access-Control-Allow-Headers', 'Content-Type')

  next()

app.set "port", process.env.PORT or 1234
app.set "views", __dirname + "/views"
app.set "view engine", "jade"
app.use methodOverride()
app.use allowCrossDomain
app.use express.static('static')
app.use express.static('bower_components')

app.get '/', allowCrossDomain, (req, res) ->
  res.render('index')

app.listen app.get('port')