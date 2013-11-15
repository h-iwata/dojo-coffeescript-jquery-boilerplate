define [
  "dojo/_base/declare"
  "dijit/_WidgetBase"
  "dojo/on"
  "dojo/has"
  "dojo/_base/lang"
], (declare, _WidgetBase, on_, has, lang) ->
  
  _easing = 'easeOutQuint'
  
  declare "SmoothScrollToTargetId", [_WidgetBase],
  
    duration: 2000 #default
    targetId: null
    
    postCreate: ->
      @targetId = if $(@domNode).attr('href') is undefined then '#' + @targetId else $(@domNode).attr('href').replace(/^.*(#.*)$/,'$1') #for IE
      on_ @domNode, "click", lang.hitch(@, @onClick)
      on_ window, (if !has("mozilla") then "mousewheel" else "DOMMouseScroll"), =>
        @_getTargetBody().stop()
    
    onClick: (event = undefined) ->
      event.preventDefault() unless event is undefined
      event.stopPropagation() unless event is undefined
      @_getTargetBody().animate
        scrollTop : if @targetId is '@' or @targetId is null or $(@targetId).length is 0 then 0 else $(@targetId).eq(0).offset().top
      , @duration , _easing
      
    _getTargetBody: ->
      $(window).scrollTop(1) if $(window).scrollTop() is 0
      if $('html').scrollTop() > 0 then $('html') else if $('body').scrollTop() > 0 then $('body')





























