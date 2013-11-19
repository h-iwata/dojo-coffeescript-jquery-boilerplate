define [
  "dojo/_base/declare"
  "dijit/_WidgetBase"
  "dijit/registry"
], (declare, _WidgetBase, registry) ->
  declare "CurrentPageNumber", [_WidgetBase],
    
    panelId:''
    
    postCreate: ->
      registry.byId(@panelId).setSubscriber(@)
      
    beforeSlide: (current)->
    
    afterSlide: (current)->
      $(@domNode).html(current + 1)