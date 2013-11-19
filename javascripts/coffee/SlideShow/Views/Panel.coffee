
define [
  "dojo/_base/declare"
  "dijit/_WidgetBase"
  "dojo/on"
  "dojo/mouse"
  "dojo/has"
], (declare, _WidgetBase, on_, mouse, has) ->
  declare "Panel", [_WidgetBase],
      
    listWidth: 190
    mouseWheel: true
    
    current: 0
    max: 0
    animating: false
    duration: 300
    Subscribers: []
    
    postCreate: ->
      @listWidth = $($(@domNode).find('li')[0]).width() if @listWidth is null
      @max = $(@domNode).find('li').length - 1
      
      if @mouseWheel
        on_ @domNode, mouse.wheel, (event) =>
          event.preventDefault()
          event.stopPropagation()
          if event.wheelDelta < 0 then @slideTo 'next' else @slideTo 'prev'
      
    setSubscriber: (Subscriber) ->
      @Subscribers.push Subscriber
    
    slideTo: (target) ->
      return false if @animating is true
      @animating = true
      Subscriber.beforeSlide(@current) for Subscriber in @Subscribers
      
      switch target
        when'next' 
          @current += 1 if @current < @max 
        when'prev' 
          @current -= 1 if @current > 0
      
      $(@domNode).animate
        left: @listWidth * - @current
      , @duration, =>
        @animating = false
        Subscriber.afterSlide(@current) for Subscriber in @Subscribers
        
        








