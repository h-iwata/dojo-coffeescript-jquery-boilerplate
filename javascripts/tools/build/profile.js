var profile = (function() {
	
	var testResourceRe = /^App\/tests\//;
	var copyOnly = function(filename, mid) {
		return (/^\/javascripts\/lib\//.test(filename));
	};

	return {
		basePath : '../../src',
		releaseDir : "../../release",
		action : 'release',

		compressLess : false,
		mini : true,
		optimize : 'shrinksafe',
		layerOptimize : 'shrinksafe',
		stripConsole : 'normal',
		selectorEngine : 'lite',

		layers : {
			'App/Controllers/Index' : {},
		},

		staticHasFeatures : {
			"config-dojo-loader-catches" : 0,
			"config-tlmSiblingOfDojo" : 1,
			"dojo-amd-factory-scan" : 0,
			"dojo-combo-api" : 1,
			"dojo-config-api" : 1,
			"dojo-config-require" : 0,
			"dojo-debug-messages" : 0,
			"dojo-dom-ready-api" : 1,
			"dojo-firebug" : 0,
			"dojo-guarantee-console" : 1,
			"dojo-has-api" : 1,
			"dojo-inject-api" : 1,
			"dojo-loader" : 1,
			"dojo-log-api" : 1,
			"dojo-modulePaths" : 1,
			"dojo-moduleUrl" : 1,
			"dojo-publish-privates" : 0,
			"dojo-requirejs-api" : 1,
			"dojo-sniff" : 1,
			"dojo-sync-loader" :1,
			"dojo-test-sniff" : 1,
			"dojo-timeout-api" : 0,
			"dojo-trace-api" : 0,
			"dojo-undef-api" : 0,
			"dojo-v1x-i18n-Api" : 0,
			"dom" : 1,
			"host-browser" : 1,
			"extend-dojo" : 1
		},

		resourceTags : {
			miniExclude : function(filename, mid) {
				return testResourceRe.test(mid) || mid == "App/tests";
			},
			copyOnly : function(filename, mid) {
				return copyOnly(filename, mid);
			},
			amd : function(filename, mid) {
				return !testResourceRe.test(mid) && !copyOnly(filename, mid) && /\.js$/.test(filename);
			}
		}
	};
})(); 
