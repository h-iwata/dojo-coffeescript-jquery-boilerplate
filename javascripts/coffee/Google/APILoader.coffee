define [
  "dojo/_base/declare"
  "dojo/Deferred"
  "//www.google.com/jsapi"
], (declarem, Deferred) ->
  {
    load: (api, version = 1)->
      deferred = new Deferred()
      google.load api, version,
        "callback" : ->
          deferred.resolve()
      return deferred.promise;
  }
