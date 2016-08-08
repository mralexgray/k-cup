	cdn = '//cdnjs.cloudflare.com/ajax/libs'

	modules = {
		'livereload', 'fs', 'path', 'util', 'morgan', 'mongoose', _:'underscore', cc:'coffeecup', pass:'@port', flash:'connect-@'
		cookie:'@-parser', body:'@-parser', helpers:'coffeecup-@', session:'express-@'
		partials:'express-@', bs:'express-bootstrap-service'
	}
			
	app = (exp = require 'express')()

	app[x] = require y.replace('@',x) for x,y of modules

	app.use x for x in [
		app.morgan 'dev'										# log every request to the console
		app.cookie()												# read cookies (needed for auth)
		app.body.json()                     # get information from html forms
		app.body.urlencoded extended: true
		app.partials()											# partials and layout support
		app.bs.serve												# bootstrap middleware
		app.session secret:__filename				# session secret
		app.pass.initialize()								# required for passport
		app.pass.session()									# persistent login sessions
		app.flash()													# flash messages stored in session
	]

	# extendHelpers = (x) -> app._.extend x, app.helpers
	
	app._.extend app.helpers, {
		cdn:cdn
		scripts: ["#{cdn}/jquery/2.2.4/jquery.js"]}
			
	for x in [['view engine','coffee'],['views',["#{__dirname}/views", 'views']]]
		app.set.apply app,x
	for x in [[app.engine,app.cc.__express],[app.partials.register,app.cc]]
		x[0].apply app,['coffee',x[1]]

	app.set 'view options', defaultLayout: "#{__dirname}/views/layout"


# API

	app.route = (r,opts) ->
		console.log "startng with opts: #{opts}"
		if opts? then app._.extend opts, app.helpers
		for path, file of r
			@get path, (req, res) ->
				console.log "getting route #{req.route.path} with hardcode:#{app._.keys opts}"
				res.render file, hardcode:app._.clone(opts)

	app.serve = (uri,path) -> app.use uri, exp.static(path or uri)

	app.include = (partialPath) -> app.helpers.userHead = partialPath
	
	server = app.livereload.createServer()
	server.watch (app.path.join(x,'views') for x in [__dirname,process.cwd()])

	module.exports = app


	###
	app.get '/', (req, res) ->
		res.render 'index', hardcode: app.helpers
	app.helpers[x] = y for x,y in {

	# console.log Object.keys app

	# app[(split = x.split ':')[0]] = require split[1] ? split[0] for x in modules

	# app.engine            'coffee'      , app.cc.__express
	# app.partials.register 'coffee'      , app.cc

	# (port = 45678) ->
	# x[0]('coffee', x[1]) for x in [[app.engine,app.cc.__express],[app.partials.register,app.cc]]

	modViews = "#{__dirname}/views"
	app.get '/', (req, res) =>
		res.render 'index', hardcode:@helpers
		# layout: true, format: true, hardcode:true
		# , locals: i:i, me:'poops'

	@(@port = process.env.PORT or 45678) ->

	app.listen port # launch
	console.log 'The magic happens on port ' + port

		 # { i:i, printout:printout }
			# partial:res.partial
		# console.log app
		# inc = (x) -> cc.compile "text @partial '" + x + "'"

		locals:
			i:require('util').inspect
			cc:cc
			alsoInc: (x) -> require('coffee-script').compile 'text @partial "#{x}"'
			inc: (x) -> cc.render "text @partial '#{x}'" # }cc.compile "text @partial #{x}"
			part:partials.partial

	app.engine '.coffee', (path,options,cb) ->
		cb null,  cc.render(require('fs').readFileSync(path, 'utf8'), options)
	app.get '/coffeecup', (req, res, next) ->
		res.render 'index.coffeecup', hello: 'world'
	routes
	require('./app/routes') app, passport # load routes: pass in app and fully config'd passport

	partials.register 'coffee', cc
	i = require('util').inspect
	partials.register 'coffee', cc
	printout = (z) -> cc.render.p -> x for x in i(z).split ','

	app.engine 'coffee', (path, options, callback) ->
		callback null, cc.render(require('fs').readFileSync(path, 'utf8'), options)


	class App
		inherit: (obj, port) ->

			for x in Object.keys(obj)
				console.log "applying #{x}"
				@[x] = obj[x]

	###


