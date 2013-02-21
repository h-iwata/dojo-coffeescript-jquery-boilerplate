define [
  "dojo/_base/declare"
  "dojo/on" 
  "dijit/_WidgetBase"
], (declare, on_, _WidgetBase) ->
  declare "testButton", [_WidgetBase],
    
    condition: "bad"
  
    postCreate: ->
      on_ @domNode, 'click', =>
        alert 'widget works ' + @condition

