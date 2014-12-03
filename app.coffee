express = require 'express'
methodOverride = require 'method-override'
app = express()

app.set "port", process.env.PORT or 1234
app.set "views", __dirname + "/views"
app.set "view engine", "jade"
app.use methodOverride()
app.use express.static('static')
app.use express.static('bower_components')

app.get '/', (req, res) ->
  res.render('index')

app.listen app.get('port')