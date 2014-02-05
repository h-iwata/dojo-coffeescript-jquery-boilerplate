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
      for simpleTab in $(@domNode).closest('ul').find('[id^=SimpleTab]')
        $(registry.byNode(simpleTab).domNode).removeClass 'active'
        $(registry.byNode(simpleTab).target).addClass 'hide'

      $(@domNode).toggleClass 'active'
      $(@target).toggleClass 'hide'

