
	app = require('../')

	console.log app

	app.route '/':'index'
	# app.get '/', (req, res) ->
	# 	res.render 'index', hardcode: app.helpers
		# layout: "#{__dirname}/../views/layout", 

	app.listen port = 45678

	console.log 'The magic happens on port ' + port


	# layout: true, format: true, hardcode:true
	# , locals: i:i, me:'poops'

	# @(@port = process.env.PORT or 45678) ->
