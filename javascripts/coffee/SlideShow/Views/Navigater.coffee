define [
  "dojo/_base/declare"
  "dijit/_WidgetBase"
  "dijit/registry"
  "dojo/on"
  "dojo/aspect"
  "dojo/ready"
], (declare, _WidgetBase, registry, on_, aspect, ready) ->
  declare "Navigater", [_WidgetBase],
    
    panelId:''
    target:''  
    
    Panel:''
    
    postCreate: ->
      ready =>
        @Panel = registry.byId(@panelId)
        on_ @domNode, 'click', =>
          @onClick()
        aspect.after @Panel, 'slideTo', =>
          @afterSlide @Panel.current

    onClick: ->
      @Panel.slideTo(@target)
    
    afterSlide: (current) ->
      if (@target is 'prev' and current is 0) or (@target is 'next' and current is @Panel.max)
        $(@domNode).css
          display: 'none'
      else
        $(@domNode).css
          display: 'block'
        
