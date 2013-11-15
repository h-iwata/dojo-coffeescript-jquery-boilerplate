var debug = true;
var AppName = "App"
var dojoConfig = {
	usePlainJson 	: true,
	async 			: true,
	parseOnLoad 	: true,
	gfxRenderer: "canvas, svg, silverlight,vml",
	locale: 'ja-jp',
	baseUrl: '/javascripts/release',
	packages: [
		{ name: 'Google', location: 'Google'},
		{ name: 'Google', location: 'Google'},
    { name: 'Sample', location: 'Sample' },
		{ name: AppName, location: AppName }
	],
	deps: [
		'dojo/parser',
		AppName + '/app'
	]
}

if (debug){
	dojoConfig.baseUrl = '/javascripts/src';
	dojoConfig.cacheBust = true;
	dojoConfig.isDebug = true; 
	dojoConfig.has = {
		"dojo-firebug": true,
		"dojo-debug-messages": true
	}
	dojoConfig.deps = [
		AppName + '/app',
		'dojo/parser'
	]
	dojoConfig.packages.push({ name: "doh", location: 'util/doh'})
} else {
	dojoConfig.packages.push({ name: "doh", location: 'doh'})
}
