define [
  "dojo/_base/declare"
  "dijit/_WidgetBase"
  "dijit/registry"
  "dojo/aspect"
], (declare, _WidgetBase, registry, aspect) ->
  declare "CurrentPageNumber", [_WidgetBase],
    
    panelId:''
    Panel: ''

    postCreate: ->
      @Panel = registry.byId(@panelId)
      aspect.after @Panel, "slideTo", =>
        @afterSlide @Panel.current
    
    afterSlide: (current)->
      $(@domNode).html(current + 1)
