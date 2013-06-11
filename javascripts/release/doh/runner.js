//>>built
define("doh/runner",["dojo/_base/lang"],function(_1){var _2={};tests=_2;this.doh=_2;_2._line="------------------------------------------------------------";_2.debug=function(){};_2.error=function(){};_2._AssertFailure=function(_3,_4){if(_2.breakOnError){debugger;}if(!(this instanceof _2._AssertFailure)){return new _2._AssertFailure(_3,_4);}if(_4){_3=(new String(_3||""))+" with hint: \n\t\t"+(new String(_4)+"\n");}this.message=new String(_3||"");return this;};_2._AssertFailure.prototype=new Error();_2._AssertFailure.prototype.constructor=_2._AssertFailure;_2._AssertFailure.prototype.name="doh._AssertFailure";_2.Deferred=function(_5){this.chain=[];this.id=this._nextId();this.fired=-1;this.paused=0;this.results=[null,null];this.canceller=_5;this.silentlyCancelled=false;};_1.extend(_2.Deferred,{getTestErrback:function(cb,_6){var _7=this;return function(){try{cb.apply(_6||_2.global||_7,arguments);}catch(e){_7.reject(e);}};},getTestCallback:function(cb,_8){var _9=this;return function(){try{cb.apply(_8||_2.global||_9,arguments);}catch(e){_9.reject(e);return;}_9.resolve(true);};},_nextId:(function(){var n=1;return function(){return n++;};})(),cancel:function(){if(this.fired==-1){if(this.canceller){this.canceller(this);}else{this.silentlyCancelled=true;}if(this.fired==-1){this.reject(new Error("Deferred(unfired)"));}}else{if(this.fired==0&&this.results[0]&&this.results[0].cancel){this.results[0].cancel();}}},_pause:function(){this.paused++;},_unpause:function(){this.paused--;if((this.paused==0)&&(this.fired>=0)){this._fire();}},_continue:function(_a){this._resback(_a);this._unpause();},_resback:function(_b){this.fired=((_b instanceof Error)?1:0);this.results[this.fired]=_b;this._fire();},_check:function(){if(this.fired!=-1){if(!this.silentlyCancelled){throw new Error("already called!");}this.silentlyCancelled=false;}},resolve:function(_c){this._check();this._resback(_c);},reject:function(_d){this._check();if(!(_d instanceof Error)){_d=new Error(_d);}this._resback(_d);},then:function(cb,eb){this.chain.push([cb,eb]);if(this.fired>=0){this._fire();}return this;},always:function(cb){this.then(cb,cb);},otherwise:function(eb){this.then(null,eb);},isFulfilled:function(){return this.fired>=0;},isResolved:function(){return this.fired==0;},isRejected:function(){return this.fired==1;},_fire:function(){var _e=this.chain;var _f=this.fired;var res=this.results[_f];var _10=this;var cb=null;while(_e.length>0&&this.paused==0){var _11=_e.shift();var f=_11[_f];if(f==null){continue;}try{res=f(res);_f=((res instanceof Error)?1:0);if(res&&res.then){cb=function(res){_10._continue(res);};this._pause();}}catch(err){_f=1;res=err;}}this.fired=_f;this.results[_f]=res;if((cb)&&(this.paused)){res.always(cb);}}});_1.extend(_2.Deferred,{getFunctionFromArgs:function(){var a=arguments;if((a[0])&&(!a[1])){if(typeof a[0]=="function"){return a[0];}else{if(typeof a[0]=="string"){return _2.global[a[0]];}}}else{if((a[0])&&(a[1])){return _1.hitch(a[0],a[1]);}}return null;},addCallbacks:function(cb,eb){this.then(cb,eb);},addCallback:function(cb,_12){var _13=this.getFunctionFromArgs(cb,_12);if(arguments.length>2){_13=_1.hitch(null,_13,arguments,2);}return this.then(_13);},addErrback:function(cb,_14){var _15=this.getFunctionFromArgs(cb,_14);if(arguments.length>2){_15=_1.hitch(null,_15,arguments,2);}return this.otherwise(_15);},addBoth:function(cb,_16){var _17=this.getFunctionFromArgs(cb,_16);if(arguments.length>2){_17=_1.hitch(null,_17,arguments,2);}return this.always(_17);},callback:function(val){this.resolve(val);},errback:function(val){this.reject(val);}});_2._testCount=0;_2._groupCount=0;_2._errorCount=0;_2._failureCount=0;_2._currentGroup=null;_2._currentTest=null;_2._paused=true;_2._init=function(){this._currentGroup=null;this._currentTest=null;this._errorCount=0;this._failureCount=0;this.debug(this._testCount,"tests to run in",this._groupCount,"groups");};_2._groups={};_2._testTypes={};_2.registerTestType=function(_18,_19){_2._testTypes[_18]=_19;};_2.registerTestType("perf",function(_1a,_1b,_1c){if(_1c==="perf"||_1b.testType==="perf"){_1b.testType="perf";if(!_2.perfTestResults){_2.perfTestResults={};_2.perfTestResults[_1a]={};}if(!_2.perfTestResults[_1a]){_2.perfTestResults[_1a]={};}if(!_2.perfTestResults[_1a][_1b.name]){_2.perfTestResults[_1a][_1b.name]={};}_1b.results=_2.perfTestResults[_1a][_1b.name];if(!("trialDuration" in _1b)){_1b.trialDuration=100;}if(!("trialDelay" in _1b)){_1b.trialDelay=100;}if(!("trialIterations" in _1b)){_1b.trialIterations=10;}}});var _1d=function(_1e,_1f,_20){var _21=_1f;if(_1.isString(_1f)){_21={name:_1f.replace("/s/g","_"),runTest:new Function("t",_1f)};}else{if(_1.isFunction(_1f)){_21={"runTest":_1f};if(_1f["name"]){_21.name=_1f.name;}else{try{var _22="function ";var ts=_21.runTest+"";if(0<=ts.indexOf(_22)){_21.name=ts.split(_22)[1].split("(",1)[0];}}catch(e){}}}else{if(_1.isString(_21.runTest)){_21.runTest=new Function("t",_21.runTest);}}}if(!_21.runTest){return 0;}var _23=_2._testTypes[_20]||_2._testTypes[_21.testType];if(_23){_23(_1e,_21);}_2._groups[_1e].push(_21);_2._testCount++;_2._testRegistered(_1e,_21);return _21;},_24=function(arg){if(_1.isString(arg)){return "string("+arg+")";}else{return typeof arg;}},_25=function(_26,_27){var _28="\targuments: ";for(var i=0;i<5;i++){_28+=_24(_26[i]);}_2.debug("ERROR:");if(_27){_2.debug("\tillegal arguments provided to doh.register; the test at argument "+_27+" wasn't a test.");}else{_2.debug("\tillegal arguments provided to doh.register");}_2.debug(_28);};_2._testRegistered=function(_29,_2a){};_2._groupStarted=function(_2b){};_2._groupFinished=function(_2c,_2d){};_2._testStarted=function(_2e,_2f){};_2._testFinished=function(_30,_31,_32){};_2._registerTest=function(_33,_34,_35){var _36=this._groups[_33];if(!_36){this._groupCount++;_36=this._groups[_33]=[];_36.inFlight=0;}if(!_34){return _36;}var _37;if(_1.isFunction(_34)||_1.isString(_34)||"runTest" in _34){return _1d(_33,_34,_35)?_36:0;}else{if(_1.isArray(_34)){for(var i=0;i<_34.length;i++){_37=_1d(_33,_34[i],_35);if(!_37){this.debug("ERROR:");this.debug("\tillegal test is test array; more information follows...");return null;}}return _36;}else{for(var _38 in _34){var _39=_34[_38];if(_1.isFunction(_39)||_1.isString(_39)){_37=_1d(_33,{name:_38,runTest:_39},_35);}else{_39.name=_39.name||_38;_37=_1d(_33,_39,_35);}if(!_37){this.debug("ERROR:");this.debug("\tillegal test is test hash; more information follows...");return null;}}return _36;}}};_2._registerTestAndCheck=function(_3a,_3b,_3c,_3d,_3e,_3f,_40){var _41=0;if(_3a){if(_3c){var _42=_3a.match(/([^\!]+)\!(.+)/);if(_42){_41=_42[1];_3a=_42[2];}}else{var _43=_3a&&_3a.split("!");if(_43.length==3){_41=_43[0];_3a=_43[1];_3c=_43[2];}else{if(_43.length==2){if(_43[1] in _2._testTypes){_3a=_43[0];_3c=_43[1];}else{_41=_43[0];_3a=_43[1];}}}}}var _44=_2._registerTest(_3a,_3b,_3c);if(_44){if(_41){_44.amdMid=_41;}if(_3f){_44.setUp=_3f;}if(_40){_44.tearDown=_40;}}else{_25(arguments,_3d);}};_2._registerUrl=function(_45,url,_46,_47,_48){this.debug("ERROR:");this.debug("\tNO registerUrl() METHOD AVAILABLE.");};var _49=(function(){var _4a=["test",function(_4b,a1){_2._registerTestAndCheck("ungrouped",a1,0,0,_4b,0,0);},"url",function(_4c,a1){_2._registerUrl("ungrouped",a1);},"group-test",function(_4d,a1,a2){_2._registerTestAndCheck(a1,a2,0,0,_4d,0,0);},"test-type",function(_4e,a1,a2){_2._registerTestAndCheck("ungrouped",a1,a2,1,_4e,0,0);},"test-up",function(_4f,a1,a2){_2._registerTestAndCheck("ungrouped",a1,0,0,_4f,a2,0);},"group-url",function(_50,a1,a2){_2._registerUrl(a1,a2);},"url-to",function(_51,a1,a2){_2._registerUrl("ungrouped",a1,a2);},"url-type",function(_52,a1,a2){_2._registerUrl("ungrouped",a1,undefined,a2);},"url-args",function(_53,a1,a2){_2._registerUrl("ungrouped",a1,undefined,0,a2);},"group-test-type",function(_54,a1,a2,a3){_2._registerTestAndCheck(a1,a2,a3,2,_54,0,0);},"group-test-up",function(_55,a1,a2,a3){_2._registerTestAndCheck(a1,a2,0,2,_55,a3,0);},"test-type-up",function(_56,a1,a2,a3){_2._registerTestAndCheck("ungrouped",a1,a2,0,_56,a3,0);},"test-up-down",function(_57,a1,a2,a3){_2._registerTestAndCheck("ungrouped",a1,0,0,_57,a2,a3);},"group-url-to",function(_58,a1,a2,a3){_2._registerUrl(a1,a2,a3);},"group-url-type",function(_59,a1,a2,a3){_2._registerUrl(a1,a2,undefined,a3);},"group-url-args",function(_5a,a1,a2,a3){_2._registerUrl(a1,a2,undefined,0,a3);},"url-to-type",function(_5b,a1,a2,a3){_2._registerUrl("ungrouped",a1,a2,a3);},"url-to-args",function(_5c,a1,a2,a3){_2._registerUrl("ungrouped",a1,a2,0,a3);},"url-type-args",function(_5d,a1,a2,a3){_2._registerUrl("ungrouped",a1,undefined,a2,a3);},"group-test-type-up",function(_5e,a1,a2,a3,a4){_2._registerTestAndCheck(a1,a2,a3,2,_5e,a4,0);},"group-test-up-down",function(_5f,a1,a2,a3,a4){_2._registerTestAndCheck(a1,a2,0,2,_5f,a3,a4);},"test-type-up-down",function(_60,a1,a2,a3,a4){_2._registerTestAndCheck("ungrouped",a1,2,0,_60,a3,a4);},"group-url-to-type",function(_61,a1,a2,a3,a4){_2._registerUrl(a1,a2,a3,a4);},"group-url-to-args",function(_62,a1,a2,a3,a4){_2._registerUrl(a1,a2,a3,0,a4);},"group-url-type-args",function(_63,a1,a2,a3,a4){_2._registerUrl(a1,a2,undefined,a3,a4);},"url-to-type-args",function(_64,a1,a2,a3,a4){_2._registerUrl("ungrouped",a1,a2,a3,a4);},"group-test-type-up-down",function(_65,a1,a2,a3,a4,a5){_2._registerTestAndCheck(a1,a2,a3,2,_65,a4,a5);},"group-url-to-type-args",function(_66,a1,a2,a3,a4,a5){_2._registerUrl(a1,a2,a3,a4,a5);}];var _67={group:"st.sf.s",test:"a.sf.o.f",type:"st",up:"f",down:"f",url:"s",to:"n",args:"o"};for(var p in _67){_67[p]=_67[p].split(".");}function _68(sig,_69,_6a,_6b){for(var _6c,_6d=sig.slice(1),_6e=_67[sig[0]],i=0;i<_6e.length;i++){_6c=_69+(_69?"-":"")+_6e[i];if(_6d.length){_68(_6d,_6c,_6a,_6b);}else{_6a.push(_6c,_6b);}}};var _6f=[];for(var sig,_70,_71,i=0;i<_4a.length;i++){sig=_4a[i++].split("-");_70=_4a[i];_71=_6f[sig.length-1]||(_6f[sig.length-1]=[]);_68(sig,"",_71,_70);}return _6f;})();_2.register=function(a1,a2,a3,a4,a5){function _72(a){if(a instanceof Array){return "a";}else{if(typeof a=="function"){return "f";}else{if(typeof a=="number"){return "n";}else{if(typeof a=="string"){if(a in _2._testTypes){return "st";}else{if(/\(/.test(a)){return "sf";}else{return "s";}}}else{return "o";}}}}};var _73=arguments.length,_74=_49[_73-1],sig=[],i;for(i=0;i<_73;i++){sig.push(_72(arguments[i]));}sig=sig.join("-");for(i=0;i<_74.length;i+=2){if(_74[i]==sig){_74[i+1](arguments,a1,a2,a3,a4,a5);return;}}_25(arguments);};_2.registerDocTests=function(_75){var _76=new dojox.testing.DocTest();var _77=_76.getTests(_75);var len=_77.length;var _78=[];for(var i=0;i<len;i++){var _79=_77[i];var _7a="";if(_79.commands.length&&_79.commands[0].indexOf("//")!=-1){var _7b=_79.commands[0].split("//");_7a=", "+_7b[_7b.length-1];}_78.push({runTest:(function(_7c){return function(t){var r=_76.runTest(_7c.commands,_7c.expectedResult);t.assertTrue(r.success);};})(_79),name:"Line "+_79.line+_7a});}this.register("DocTests: "+_75,_78);};_2.registerTest=function(_7d,_7e,_7f){_2.register(_7d+(_7f?"!"+_7f:""),_7e);};_2.registerGroup=function(_80,_81,_82,_83,_84){var _85=[(_80?_80:"")+(_84?"!"+_84:""),_81];_82&&_85.push(_82);_83&&_85.push(_83);_2.register.apply(_2,_85);};_2.registerTestNs=function(_86,ns){_2.register(_86,ns);};_2.registerTests=function(_87,_88,_89){_2.register(_87+(_89?"!"+_89:""),_88);};_2.registerUrl=function(_8a,url,_8b,_8c,_8d){_2.register(_8a+(_8c?"!"+_8c:""),url+"",_8b||10000,_8d||{});};_2.t=_2.assertTrue=function(_8e,_8f){if(arguments.length<1){throw new _2._AssertFailure("assertTrue failed because it was not passed at least 1 argument");}if(!eval(_8e)){throw new _2._AssertFailure("assertTrue('"+_8e+"') failed",_8f);}};_2.f=_2.assertFalse=function(_90,_91){if(arguments.length<1){throw new _2._AssertFailure("assertFalse failed because it was not passed at least 1 argument");}if(eval(_90)){throw new _2._AssertFailure("assertFalse('"+_90+"') failed",_91);}};_2.e=_2.assertError=function(_92,_93,_94,_95,_96){try{_93[_94].apply(_93,_95);}catch(e){if(e instanceof _92){return true;}else{throw new _2._AssertFailure("assertError() failed:\n\texpected error\n\t\t"+_92+"\n\tbut got\n\t\t"+e+"\n\n",_96);}}throw new _2._AssertFailure("assertError() failed:\n\texpected error\n\t\t"+_92+"\n\tbut no error caught\n\n",_96);};_2.is=_2.assertEqual=function(_97,_98,_99,_9a){if((_97===undefined)&&(_98===undefined)){return true;}if(arguments.length<2){throw _2._AssertFailure("assertEqual failed because it was not passed 2 arguments");}if((_97===_98)||(_97==_98)||(typeof _97=="number"&&typeof _98=="number"&&isNaN(_97)&&isNaN(_98))){return true;}if((_1.isArray(_97)&&_1.isArray(_98))&&(this._arrayEq(_97,_98))){return true;}if(((typeof _97=="object")&&((typeof _98=="object")))&&(this._objPropEq(_97,_98))){return true;}if(_9a){return false;}throw new _2._AssertFailure("assertEqual() failed:\n\texpected\n\t\t"+_97+"\n\tbut got\n\t\t"+_98+"\n\n",_99);};_2.isNot=_2.assertNotEqual=function(_9b,_9c,_9d){if((_9b===undefined)&&(_9c===undefined)){throw new _2._AssertFailure("assertNotEqual() failed: not expected |"+_9b+"| but got |"+_9c+"|",_9d);}if(arguments.length<2){throw _2._AssertFailure("assertEqual failed because it was not passed 2 arguments");}if((_9b===_9c)||(_9b==_9c)){throw new _2._AssertFailure("assertNotEqual() failed: not expected |"+_9b+"| but got |"+_9c+"|",_9d);}if((_1.isArray(_9b)&&_1.isArray(_9c))&&(this._arrayEq(_9b,_9c))){throw new _2._AssertFailure("assertNotEqual() failed: not expected |"+_9b+"| but got |"+_9c+"|",_9d);}if(((typeof _9b=="object")&&((typeof _9c=="object")))){var _9e=false;try{_9e=this._objPropEq(_9b,_9c);}catch(e){if(!(e instanceof _2._AssertFailure)){throw e;}}if(_9e){throw new _2._AssertFailure("assertNotEqual() failed: not expected |"+_9b+"| but got |"+_9c+"|",_9d);}}return true;};_2._arrayEq=function(_9f,_a0){if(_9f.length!=_a0.length){return false;}for(var x=0;x<_9f.length;x++){if(!_2.assertEqual(_9f[x],_a0[x],0,true)){return false;}}return true;};_2._objPropEq=function(_a1,_a2){if(_a1===null&&_a2===null){return true;}if(_a1===null||_a2===null){return false;}if(_a1 instanceof Date){return _a2 instanceof Date&&_a1.getTime()==_a2.getTime();}var x;for(x in _a2){if(_a1[x]===undefined){return false;}}for(x in _a1){if(!_2.assertEqual(_a1[x],_a2[x],0,true)){return false;}}return true;};_2._setupGroupForRun=function(_a3){var tg=this._groups[_a3];this.debug(this._line);this.debug("GROUP","\""+_a3+"\"","has",tg.length,"test"+((tg.length>1)?"s":"")+" to run");_2._groupStarted(_a3);};_2._handleFailure=function(_a4,_a5,e){this._groups[_a4].failures++;var out="";if(e instanceof this._AssertFailure){this._failureCount++;if(e["fileName"]){out+=e.fileName+":";}if(e["lineNumber"]){out+=e.lineNumber+" ";}out+=e.message;this.error("\t_AssertFailure:",out);}else{this._errorCount++;this.error("\tError:",e.message||e);}if(_a5.runTest["toSource"]){var ss=_a5.runTest.toSource();this.debug("\tERROR IN:\n\t\t",ss);}else{this.debug("\tERROR IN:\n\t\t",_a5.runTest);}if(e.rhinoException){e.rhinoException.printStackTrace();}else{if(e.javaException){e.javaException.printStackTrace();}}};_2._runPerfFixture=function(_a6,_a7){var tg=this._groups[_a6];_a7.startTime=new Date();var def=new _2.Deferred();tg.inFlight++;def.groupName=_a6;def.fixture=_a7;var _a8=false;def.otherwise(function(err){_2._handleFailure(_a6,_a7,err);_a8=true;});var _a9;var _aa=function(){_a9=true;if(_a7["tearDown"]){_a7.tearDown(_2);}tg.inFlight--;if((!tg.inFlight)&&(tg.iterated)){_2._groupFinished(_a6,!tg.failures);}_2._testFinished(_a6,_a7,!_a8);if(_2._paused){_2.run();}};var _ab;var to=_a7.timeout;if(to>0){_ab=setTimeout(function(){def.reject(new Error("test timeout in "+_a7.name.toString()));},to);}def.always(function(){if(_ab){clearTimeout(_ab);}_aa();});var res=_a7.results;res.trials=[];var _ac=_2._calcTrialIterations(_a6,_a7);_ac.then(function(_ad){if(_ad){var _ae=_a7.trialIterations;_2.debug("TIMING TEST: ["+_a7.name+"]\n\t\tITERATIONS PER TRIAL: "+_ad+"\n\tTRIALS: "+_ae);var _af=function(){var _b0=new Date();var _b1=new _2.Deferred();var _b2={countdown:_ad};var _b3=function(_b4){while(_b4){try{_b4.countdown--;if(_b4.countdown){var ret=_a7.runTest(_2);if(ret&&ret.then){var _b5={countdown:_b4.countdown};ret.then(function(){_b3(_b5);},function(err){_2._handleFailure(_a6,_a7,err);_a7.endTime=new Date();def.reject(err);});_b4=null;}}else{_b1.resolve(new Date());_b4=null;}}catch(err){_a7.endTime=new Date();_b1.reject(err);}}};_b1.then(function(end){var _b6={trial:(_a7.trialIterations-_ae),testIterations:_ad,executionTime:(end.getTime()-_b0.getTime()),average:(end.getTime()-_b0.getTime())/_ad};res.trials.push(_b6);_2.debug("\n\t\tTRIAL #: "+_b6.trial+"\n\tTIME: "+_b6.executionTime+"ms.\n\tAVG TEST TIME: "+(_b6.executionTime/_b6.testIterations)+"ms.");_ae--;if(_ae){setTimeout(_af,_a7.trialDelay);}else{var t=res.trials;_a7.endTime=new Date();def.resolve(true);}},function(err){_a7.endTime=new Date();def.reject(err);});_b3(_b2);};_af();}},function(err){_a7.endTime=new Date();def.reject(err);});if(!_a9){_2.pause();}return def;};_2._calcTrialIterations=function(_b7,_b8){var def=new _2.Deferred();var _b9=function(){var _ba=_1.hitch(_b8,_b8.runTest);var _bb={start:new Date(),curIter:0,iterations:5};var _bc=function(_bd){while(_bd){if(_bd.curIter<_bd.iterations){try{var ret=_ba(_2);if(ret&&ret.then){var _be={start:_bd.start,curIter:_bd.curIter+1,iterations:_bd.iterations};ret.then(function(){_bc(_be);},function(err){_b8.endTime=new Date();def.reject(err);});_bd=null;}else{_bd.curIter++;}}catch(err){_b8.endTime=new Date();def.reject(err);return;}}else{var end=new Date();var _bf=(end.getTime()-_bd.start.getTime());if(_bf<_b8.trialDuration){var _c0={iterations:_bd.iterations*2,curIter:0};_bd=null;setTimeout(function(){_c0.start=new Date();_bc(_c0);},50);}else{var _c1=_bd.iterations;setTimeout(function(){def.resolve(_c1);},50);_bd=null;}}}};_bc(_bb);};setTimeout(_b9,10);return def;};_2._runRegFixture=function(_c2,_c3){var tg=this._groups[_c2];_c3.startTime=new Date();var ret=_c3.runTest(this);if(ret&&ret.then){if(ret.promise){ret=ret.promise;}tg.inFlight++;ret.groupName=_c2;ret.fixture=_c3;var _c4=false;ret.otherwise(function(err){if(_c4){return;}_2._handleFailure(_c2,_c3,err);_c4=true;});var _c5;var _c6=function(){if(_c5){return;}_c5=true;_c3.endTime=new Date();if(_c3.tearDown){try{_c3.tearDown(_2);}catch(e){this.debug("Error tearing down test: "+e.message);}}tg.inFlight--;_2._testFinished(_c2,_c3,!_c4);if((!tg.inFlight)&&(tg.iterated)){_2._groupFinished(_c2,!tg.failures);}if(_2._paused){_2.run();}};var _c7=setTimeout(function(){if(!_c7){return;}_2._handleFailure(_c2,_c3,new Error("test timeout in "+_c3.name.toString()));_c4=true;_c6();},_c3["timeout"]||1000);ret.always(function(){clearTimeout(_c7);_c7=null;_c6();});if(!_c5){_2.pause();}return ret;}else{}};_2._runFixture=function(_c8,_c9){var tg=this._groups[_c8];this._testStarted(_c8,_c9);var _ca=false;var err=null;try{_c9.group=tg;if(_c9["setUp"]){_c9.setUp(this);}if(_c9["runTest"]){if(_c9.testType==="perf"){return _2._runPerfFixture(_c8,_c9);}else{var ret=_2._runRegFixture(_c8,_c9);if(ret){return ret;}}}}catch(e){_ca=true;err=e;}_c9.endTime=new Date();try{if(_c9["tearDown"]){_c9.tearDown(this);}}catch(e){this.debug("Error tearing down test: "+e.message);}var d=new _2.Deferred();setTimeout(_1.hitch(this,function(){if(_ca){this._handleFailure(_c8,_c9,err);}this._testFinished(_c8,_c9,!_ca);if((!tg.inFlight)&&(tg.iterated)){_2._groupFinished(_c8,!tg.failures);}else{if(tg.inFlight>0){setTimeout(_1.hitch(this,function(){_2.runGroup(_c8);}),100);this._paused=true;}}if(_2._paused){_2.run();}}),30);_2.pause();return d;};_2.runGroup=function(_cb,idx){idx=idx||0;var tg=this._groups[_cb];if(tg.skip===true){return;}if(_1.isArray(tg)){if(tg.iterated===undefined){tg.iterated=false;tg.inFlight=0;tg.failures=0;this._setupGroupForRun(_cb);if(tg["setUp"]){tg.setUp(this);}}for(var y=idx;y<tg.length;y++){if(this._paused){this._currentTest=y;return;}_2._runFixture(_cb,tg[y]);if(this._paused){this._currentTest=y+1;if(this._currentTest==tg.length){tg.iterated=true;}return;}}tg.iterated=true;if(!tg.inFlight){if(tg["tearDown"]){tg.tearDown(this);}_2._groupFinished(_cb,!tg.failures);}}};_2._onEnd=function(){};_2._report=function(){this.debug(this._line);this.debug("| TEST SUMMARY:");this.debug(this._line);this.debug("\t",this._testCount,"tests in",this._groupCount,"groups");this.debug("\t",this._errorCount,"errors");this.debug("\t",this._failureCount,"failures");};_2.togglePaused=function(){this[(this._paused)?"run":"pause"]();};_2.pause=function(){this._paused=true;};_2.run=function(){this._paused=false;var cg=this._currentGroup;var ct=this._currentTest;var _cc=false;if(!cg){this._init();_cc=true;}this._currentGroup=null;this._currentTest=null;for(var x in this._groups){if(((!_cc)&&(x==cg))||(_cc)){if(this._paused){return;}this._currentGroup=x;if(!_cc){_cc=true;this.runGroup(x,ct);}else{this.runGroup(x);}if(this._paused){return;}}}this._currentGroup=null;this._currentTest=null;this._paused=false;this._onEnd();this._report();};_2.runOnLoad=function(){require(["dojo/ready"],function(_cd){_cd(_2,"run");});};return _2;});if(typeof window!="undefined"&&typeof location!="undefined"&&typeof document!="undefined"&&window.location==location&&window.document==document){require(["doh/_browserRunner"]);}