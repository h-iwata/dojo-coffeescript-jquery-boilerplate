define [
  "dojo/_base/declare"
  "dijit/_WidgetBase"
], (declare, _WidgetBase) ->
  declare "CopyInnerDomToTargetId", [_WidgetBase],
    
    targetId: null

    postCreate: ->
      $("##{@targetId}").html $($(@domNode).html()).clone()

