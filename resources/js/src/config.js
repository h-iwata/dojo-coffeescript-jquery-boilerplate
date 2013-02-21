//for debug
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
	locale: 'ja-jp',
	baseUrl: '/resources/js',
	packages: [
		{ name: AppName, location: 'src/' + AppName, main: 'app' },
		{ name: 'jquery', location: 'src/jquery'},
	],
	paths: {
		AppName : "/resources/js/src/" + AppName
	},
	deps: [
		AppName + '/lib/Debug',
		AppName + '/app',
		'dojo/parser',
	]
};


