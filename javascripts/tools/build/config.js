//for build
var AppName = "App"
var dojoConfig = {
	usePlainJson 	: true,
	isDebug 		: true,
	async 			: true,
	gfxRenderer: "canvas, svg, silverlight,vml",
	locale: 'ja-jp',
	packages: [
		{ name: AppName, location:  AppName},
		{ name: 'dojo', location: 'dojo'},
		{ name: 'dijit', location: 'dijit'},
		{ name: 'dojox', location: 'dojox'},
		{ name: "doh", location: 'util/doh'}
	],
	deps: [
		'dojo/parser',
		AppName + '/app'
	]
};


