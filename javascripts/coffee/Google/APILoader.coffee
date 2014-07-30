define [
  "dojo/_base/declare"
  "dojo/Deferred"
  "//www.google.com/jsapi"
], (declarem, Deferred) ->
  deferred = new Deferred()
  apiCallbackName = "apiCallback#{(new Date()).getTime()}"
  window[apiCallbackName] = ->
    deferred.resolve()
  {
    load: (api, version = 1)->
      google.load api, version,
        #空の関数をグローバルに指定することでAMDモードになる
        "callback" : apiCallbackName
      return deferred.promise;
  }
  

  
