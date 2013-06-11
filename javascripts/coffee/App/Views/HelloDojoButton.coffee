define [
  "dojo/_base/declare"
  "dojo/on" 
  "dijit/_WidgetBase"
], (declare, on_, _WidgetBase) ->
  declare "HelloDojoButton", [_WidgetBase],
    
    message: null
  
    postCreate: ->
      on_ @domNode, 'click', =>
        $(@domNode).after $('<p />').text @message

