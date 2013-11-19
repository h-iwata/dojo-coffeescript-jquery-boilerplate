define [
  "dojo/_base/declare"
  "dijit/_WidgetBase"
  "dijit/registry"
  "dojo/on"
  "dojo/ready"
], (declare, _WidgetBase, registry, on_, ready) ->
  declare "Navigater", [_WidgetBase],
    
    panelId:''
    target:''  
    
    Panel:''
    
    postCreate: ->
      ready =>
        @Panel = registry.byId(@panelId)
        @Panel.setSubscriber(@)
        on_ @domNode, 'click', =>
          @onClick()
      
    onClick: ->
      @Panel.slideTo(@target)
    
    beforeSlide: (current)->
    
    afterSlide: (current) ->
      if (@target is 'prev' and current is 0) or (@target is 'next' and current is @Panel.max)
        $(@domNode).css
          display: 'none'
      else
        $(@domNode).css
          display: 'block'
        
