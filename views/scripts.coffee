link rel: 'stylesheet', href:x for x in @sheets
script src: x for x in @scripts
script '''
	document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"></' + 'script>')
'''
