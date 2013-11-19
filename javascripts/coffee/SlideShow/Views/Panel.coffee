
define [
  "dojo/_base/declare"
  "dijit/_WidgetBase"
  "dojo/on"
  "dojo/mouse"
  "dojo/has"
], (declare, _WidgetBase, on_, mouse, has) ->
  declare "Panel", [_WidgetBase],
      
    listWidth: null
    mouseWheel: true
    
    current: 0
    max: 0
    animating: false
    duration: 300
    
    postCreate: ->
      @listWidth = $($(@domNode).find('li')[0]).width() if @listWidth is null
      @max = $(@domNode).find('li').length - 1
      
      if @mouseWheel
        on_ @domNode, mouse.wheel, (event) =>
          event.preventDefault()
          event.stopPropagation()
          if event.wheelDelta < 0 then @slideTo 'next' else @slideTo 'prev'
     
    slideTo: (target) ->
      return false if @animating is true
      @animating = true
      switch target
        when 'next'
          @current += 1 if @current < @max
        when 'prev'
          @current -= 1 if @current > 0
        else
          @current = target if $.isNumeric(target) is true

      $(@domNode).animate
        left: @listWidth * - @current
      , @duration, =>
        @animating = false
        return @current
        
        








