define [
  "dojo/_base/declare"
  "dijit/_WidgetBase"
  "dojo/on"
], (declare, _WidgetBase, on_) ->
  
  declare "PositionFixedUnlessScrollOnTop", [_WidgetBase],
    
    startFixed: 39
   
    postCreate: ->
      $(window).scroll =>
        position = $(document).scrollTop()
        if position >= @startFixed
          $(@domNode).addClass('fixed')
        
        else if position < @startFixed
          $(@domNode).removeClass('fixed')























