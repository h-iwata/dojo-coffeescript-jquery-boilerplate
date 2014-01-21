define [
  "dojo/_base/declare"
  "dijit/_WidgetBase"
  "dojo/request"
  "dojo/parser"
], (declare, _WidgetBase, request, parser) ->
  declare "LazyLoad", [_WidgetBase],
    
    url:"/"
    method: "GET"
    data: {}
    event: "onLoad"

    postCreate: ->
      request(@url,
          method: @method
          query: @data
      ).then (result) =>
        $(@domNode).html result
        parser.parse @domNode
