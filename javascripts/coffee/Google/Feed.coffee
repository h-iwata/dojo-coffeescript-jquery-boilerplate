define [
  "dojo/_base/declare"
  "dojo/Deferred"
  "Google/APILoader"
], (declare, Deferred, GoogleAPILoader) ->
  
  getEntries: (url, length = 4) ->
    deferred = new Deferred()
    GoogleAPILoader.load("feeds").then =>
      feed = new google.feeds.Feed(url);
      feed.setNumEntries(length)
      feed.load (result) ->
        unless result.error
          deferred.resolve(result.feed.entries) 
        else
          deferred.reject(result.error)
    return deferred.promise
