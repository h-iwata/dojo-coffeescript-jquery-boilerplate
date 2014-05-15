define [
  "dojo/_base/declare"
  "dijit/_WidgetBase"
  "dojo/on"
  "dojo/io-query"
], (declare, _WidgetBase, on_, ioQuery) ->
  declare "OpenSNSWindow", [_WidgetBase],
    
    width:650
    height:450
    
    type: null
    types: ['facebook', 'twitter', 'google+', 'linkedin']
    
    getUrl:
      'facebook': =>
        "http://www.facebook.com/share.php?#{ioQuery.objectToQuery {u: location.href, t: document.title }}"
          
      'twitter': =>
        "http://twitter.com/share?#{ioQuery.objectToQuery {url: location.href, text: document.title}}"
      'google+': =>
        "https://plus.google.com/share?#{ioQuery.objectToQuery {url: location.href}}"
      'linkedin':->
        "http://www.linkedin.com/shareArticle?#{ioQuery.objectToQuery {url:location.href, title:document.title, mini:true}}"
    postCreate: ->
      if not (@type in @types)
        console.log "#{@type} is not supported. Syntax\n-> data-dojo-props=\"type: {'facebook'|'twitter'|'google+'|'linkedin'}\""
        return false
      @set 'href', @getUrl[@type]()
      on_ @domNode, 'click', (event) =>
        event.preventDefault()
        window.open @getUrl[@type](), "@type share window", "width=#{@width}, height=#{@height}, menuber=no, toolbar=no, scrollbnars=yes" 



























