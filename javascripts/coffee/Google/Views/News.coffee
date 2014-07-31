define [
  "dojo/_base/declare"
  "dijit/_WidgetBase"
  "dojo/io-query"
  "../Feed"
], (declare, _WidgetBase, ioQuery, GoogleFeed) ->
  jQuery.fn.removeAllAttributes = ->
    @.each ->
      attributes = (attribute.name for attribute in @attributes) 
      $(@).removeAttr(attribute) for attribute in attributes
      
  declare "News", [_WidgetBase],
    url : "https://news.google.com/news/feeds"
    
    query: 'coffeescript'
    
    options: {
      hl: 'ja'
      ned: 'us'
      ie: 'UTF-8'
      oe: 'UTF-8'
      output: 'atom'
      rsz: 'large'
      q: null
    }
    
    length: 4
    noStyle: false
    
    postCreate: ->
      @options['q'] = @query if @options['q'] is null and @query isnt null
      GoogleFeed.getEntries("#{@url}?#{ioQuery.objectToQuery @options}", @length).then (results) =>
        $(@domNode).empty()
        @setEntries results
      , (error) ->
        $(@domNode).append error
    
    setEntries: (entries) ->
      for entry in entries
        $(@domNode).append entry.content
        $(tag).removeAllAttributes() for tag in $(@domNode).find('*:not(img)') when @noStyle

