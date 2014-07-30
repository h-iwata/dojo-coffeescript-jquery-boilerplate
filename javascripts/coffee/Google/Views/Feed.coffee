define [
  "dojo/_base/declare"
  "dijit/_WidgetBase"
  "dojo/Deferred",
  "Google/APILoader"
], (declare, _WidgetBase, Deferred, GoogleAPILoader) ->
  declare "Feed", [_WidgetBase],
  
    url : "https://news.google.com/news/feeds?hl=ja&ned=us&ie=UTF-8&oe=UTF-8&output=atom&q=coffee-script"
    
    postCreate: ->
      jQuery.fn.removeAllAttributes = ->
        @.each ->
          attributes = (attribute.name for attribute in @attributes) 
          $(@).removeAttr(attribute) for attribute in attributes  
      @getFeedEntries(@url).then (results) =>
        for entry in results
          #$(tag).removeAllAttributes() for tag in $(entry.content).find('*') 
          $(@domNode).append entry.content 

    getFeedEntries: (url) ->
      deferred = new Deferred()
      GoogleAPILoader.load("feeds").then =>
        feed = new google.feeds.Feed(url);
        feed.load (result) ->
          unless result.error
            deferred.resolve(result.feed.entries) 
          else
            deferred.reject(esult.error)
      return deferred.promise
