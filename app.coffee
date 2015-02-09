fs = require 'fs'
ini = require 'ini'
express = require 'express'
methodOverride = require 'method-override'
compass = require 'node-compass'
app = express()

config = ini.parse(fs.readFileSync('./config.ini', 'utf-8'))
allowCrossDomain = (req, res, next) ->
  res.header('Access-Control-Allow-Origin', config.api.domain)
  res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE')
  res.header('Access-Control-Allow-Headers', 'Content-Type')

  next()

app.set "port", process.env.PORT or 1234
app.set "views", __dirname + "/views"
app.set "view engine", "jade"
app.use methodOverride()
app.use allowCrossDomain
app.use compass( config_file: '../config.rb', project: 'static', cache: no)
app.use express.static('static')
app.use express.static('bower_components')



app.get '/', allowCrossDomain, (req, res) ->
  res.render('index', apiUrl: config.api.url)

app.listen app.get('port')