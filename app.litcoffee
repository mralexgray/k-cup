	
	
	
	module.exports = (favicondir) ->
	
		cdn = '//cdnjs.cloudflare.com/ajax/libs'

		modules = {
			'fs', 'path', 'util', 'morgan', 'mongoose'
			_:'underscore', cc:'coffeecup', pass:'@port', flash:'connect-@', bcrypt: '@-nodejs'
			cookie:'@-parser', body:'@-parser', helpers:'coffeecup-@'
			favicons: 'connect-@', static: 'serve-@'
			partials:'express-@', bs:'express-bootstrap-service', local: 'passport-@', facebook: 'passport-@'
		}

		app = (exp = require 'express')()

		app[x] = require y.replace('@',x) for x,y of modules
		
		for x in [['view engine','coffee'],['views',["#{__dirname}/views", 'views']]]
			app.set.apply app,x
		for x in [[app.engine,app.cc.__express],[app.partials.register,app.cc]]
			x[0].apply app,['coffee',x[1]]

		app.set 'view options', defaultLayout: "#{__dirname}/views/layout"

		
		app.icons = (dir) -> app.use app.favicons dir
		
		[favicondir,app.path.join(process.cwd(),'icons')].some (x) ->
			if x? and app.fs.existsSync x
				console.log "gonna use favicon dir: #{x}"
				app.icons x
				return true
			false
		
		app.use x for x in [
			app.morgan 'dev'										# log every request to the console
			app.cookie()												# read cookies (needed for auth)
			app.body.json()                     # get information from html forms
			app.body.urlencoded extended: true
			require('express-session')({
				secret:__filename				# session secret
				resave: true
				saveUninitialized: true})
			app.pass.initialize()								# required for passport
			app.pass.session()									# persistent login sessions
			app.flash()													# flash messages stored in session
			app.partials()											# partials and layout support
			app.bs.serve												# bootstrap middleware
		]

		# extendHelpers = (x) -> app._.extend x, app.helpers
		
		app._.extend app.helpers,
			cdn: cdn
			scripts: ["#{cdn}/jquery/2.2.4/jquery.js",'/bootstrap/js']
			sheets: ['/bootstrap/css',"#{cdn}/font-awesome/4.0.3/css/font-awesome.min.css"]
				
			         # '//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css']				


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
		
		app

	
		# server = app.livereload.createServer
		# 	originalPath: 'http://113w15.com'
			
		# reloadPaths = (app.path.join(x,'views') for x in [__dirname,process.cwd()])
		# console.log "Watching reloads in #{reloadPaths}"
		# server.watch reloadPaths

			


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


