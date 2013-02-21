//for build
var AppName = "App"
var dojoConfig = {
	usePlainJson 	: true,
	isDebug 		: true,
	async 			: true,
	parseOnLoad 	: true,
	has: {
		"dojo-firebug": true,
		"dojo-debug-messages": true
	},
	cacheBust: true,
	gfxRenderer: "canvas, svg, silverlight,vml",
	locale 			: 'ja-jp',
	baseUrl 		: '../../',
	packages: [
		{ name: AppName, location: 'src/' + AppName, main: 'app' },
		{ name: 'jquery', location: 'src/jquery'},
		{ name: 'dojo', location: 'src/dojo'},
		{ name: 'dijit', location: 'src/dijit'},
		{ name: 'dojox', location: 'src/dojox'},
	],
	paths 			: {
		AppName : "/resources/js/src/" + AppName
	},
	deps 			: [
		'dojo/parser',
		AppName + '/app'
	]
};


