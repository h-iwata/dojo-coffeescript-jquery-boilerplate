define [
  'dojo/_base/declare'
  'dijit/_WidgetBase'
  'dojo/on'
], (declare, _WidgetBase, on_) ->
   
  declare 'ToggleTargetHideClassButton', [_WidgetBase],
    
    target: "" #css selector
    
    constructor: (args)->
      declare.safeMixin @, args
      if @target is ""
        console.warn "property \"target\" is not set. usage: data-dojo-props=\"target:[css selector]\""
        return false 

    postCreate: ->
      if $(@target).length is 0
        console.warn "target dom '$(#{@target})' is not found"
        return false
      else
        if $(@domNode).attr('type') is 'checkbox'
          @toggleHideClass() if $(@domNode).is(':checked')
          $(@domNode).change => @onClick()
        else 
          on_ @domNode, 'click', => @onClick()
    
    onClick: ->
      $(@domNode).toggleClass 'active'
      $(@target).toggleClass 'hide'
    
   
