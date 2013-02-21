//for release
var AppName = 'App';
var dojoConfig = {
	cacheBust: false,
	usePlainJson 	: true,
	async 			: true,
	parseOnLoad 	: true,
	locale 			: 'ja-jp',
	baseUrl 		: '/resources/js',
	gfxRenderer: "canvas, svg, silverlight,vml",
	packages: [
		 { name: AppName, location: 'release/' + AppName, main: 'app' },
		 { name: 'jquery', location: 'release/jquery'}
	],
	paths 			: {
		AppName : "/resources/js/release/" + AppName
	},
	deps 			: [
		'dojo/parser',
		AppName + '/app'
	]
};
