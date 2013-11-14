define [
  "dojo/_base/declare"
  "dijit/_WidgetBase"
], (declare, _WidgetBase) ->
  declare "#{WidgetName}", [_WidgetBase],
      
    postCreate: ->
      console.log "#{WidgetName} is created"