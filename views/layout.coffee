
doctype 5
html ->
	head ->
		meta charset: 'utf-8'
		meta name: 'viewport', content: ['width=1','initial-scale=1','user-scalable=1']

		stylus '''
			.stripped
			  padding: 2.25em 1.6875em;
			  background-image: -webkit-repeating-linear-gradient(135deg, rgba(0,0,0,.3), rgba(0,0,0,.3) 1px, transparent 2px, transparent 2px, rgba(0,0,0,.3) 3px)
			  background-image: -moz-repeating-linear-gradient(135deg, rgba(0,0,0,.3), rgba(0,0,0,.3) 1px, transparent 2px, transparent 2px, rgba(0,0,0,.3) 3px)
			  background-image: -o-repeating-linear-gradient(135deg, rgba(0,0,0,.3), rgba(0,0,0,.3) 1px, transparent 2px, transparent 2px, rgba(0,0,0,.3) 3px)
			  background-image: repeating-linear-gradient(135deg, rgba(0,0,0,.3), rgba(0,0,0,.3) 1px, transparent 2px, transparent 2px, rgba(0,0,0,.3) 3px)
			  -webkit-background-size: 4px 4px
			  -moz-background-size: 4px 4px
			  background-size: 4px 4px
  	'''
		# title 'Base App'
		text @partial 'scripts', @hardcode
		text @partial userHead, @harcode if userHead?
		coffeescript ->
			$ ->
				# $('body').addClass 'stripped'
				console.log @
	body -> @body
