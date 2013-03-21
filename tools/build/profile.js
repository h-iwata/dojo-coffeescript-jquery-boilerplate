var profile = {
	
	action: 'release',
	
	basePath: '../../src',
	
	mini: true,

	compressLess: true,

	optimize: 'shrinksafe',

	layerOptimize: 'shrinksafe',

	stripConsole: 'normal',

	selectorEngine: 'acme',

	layers: {
		'App/Controllers/Index' :{},
	},
	
	resourceTags:{
		test: function (filename, mid) {
			return false;
		},
		copyOnly: function (filename, mid) {
			return (/^\/resources\/js\/lib\//.test(filename));
		},
		amd: function(filename, mid){
			return !this.copyOnly(filename, mid) && /\.js$/.test(filename);
		}
	}
};
