var profile = (function(){
	return {
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
})();
