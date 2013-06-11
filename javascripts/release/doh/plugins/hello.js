//>>built
define("doh/plugins/hello",["doh/runner"],function(_1){var _2=_1.run,_3=false;_1.run=function(){if(!_3){_1.debug("doh.plugins.hello plugin says Hello!");_3=true;}_2.apply(_1,arguments);};});