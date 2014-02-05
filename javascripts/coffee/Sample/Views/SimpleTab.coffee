define [
  'dojo/_base/declare'
  'dijit/_WidgetBase'
  'dojo/on'
  'dojo/ready'
  'dijit/registry'
], (declare, _WidgetBase, on_, ready, registry) ->
  
  declare 'SimpleTab', [_WidgetBase],
    
    postCreate: ->
      on_ @domNode, 'click', => @toggleHideClass()

    toggleHideClass: ->
      for simpleTabs in $(@domNode).closest('ul').find('li[id^=SimpleTab]')
        $(registry.byNode(simpleTabs).domNode).removeClass 'active'
        $(registry.byNode(simpleTabs).target).addClass 'hide'

      $(@domNode).toggleClass 'active'
      $(@target).toggleClass 'hide'

