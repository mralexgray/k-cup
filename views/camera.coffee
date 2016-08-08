
canvas "#videoCanvas", width: 640, height: 480, ->
  p'Please use a browser that supports the Canvas Element'

script src:'//rawgithub.com/phoboslab/jsmpeg/master/jsmpg.js'


coffeescript ->
	$ ->
		# Setup the WebSocket connection and start the player
		client = new WebSocket('ws://10.0.0.201*-+:8084/')
		canvas = document.getElementById('videoCanvas')
		player = new jsmpeg(client, canvas: canvas)
