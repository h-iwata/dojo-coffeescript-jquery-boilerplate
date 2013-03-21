var debug = true;
var AppName = "App"
var dojoConfig = {
	usePlainJson 	: true,
	async 			: true,
	parseOnLoad 	: true,
	gfxRenderer: "canvas, svg, silverlight,vml",
	locale: 'ja-jp',
	baseUrl: '/resources/js/release',
	packages: [
		{ name: AppName, location: AppName },
		{ name: "lib", location: '../lib'}
	],
	deps: [
		'dojo/parser',
		AppName + '/app'
	]
}

if (debug){
	dojoConfig.baseUrl = '/resources/js/src';
	dojoConfig.cacheBust = true;
	dojoConfig.isDebug = true; 
	dojoConfig.has = {
		"dojo-firebug": true,
		"dojo-debug-messages": true
	}
	dojoConfig.deps = [
		AppName + '/lib/Debug',
		AppName + '/app',
		'dojo/parser'
	]
}

























