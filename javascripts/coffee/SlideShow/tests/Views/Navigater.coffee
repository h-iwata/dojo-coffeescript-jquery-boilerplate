require [
  "doh/runner"
  'dojo/ready'
  'dijit/registry'
  'dojo/_base/lang'
], (doh, ready, registry, lang) ->
  ready ->
    NavigaterPrev = registry.byId 'NavigaterPrev'
    NavigaterNext = registry.byId 'NavigaterNext'
    Panel = registry.byId NavigaterPrev.panelId
    Panel.duration = 10
    doh.register "aop works fine", [
        name: 'NavigaterPrev is shown if Panel.current is not 0 after slide'
        setUp: ->
          Panel.current = 0
        runTest: ->
          doh.assertEqual 'none', $(NavigaterPrev.domNode).css('display')
          Panel.slideTo 'next' 
          deferred = new doh.Deferred()
          setTimeout deferred.getTestCallback( ->
            doh.assertNotEqual 'none', $(NavigaterPrev.domNode).css 'display'
            doh.assertEqual 'block', $(NavigaterPrev.domNode).css 'display'
          ), 300
          deferred
        timeout: 400
      ,
        name: 'NavigaterNext is hidden if Panel.current is not Panel.max after slide'
        setUp: ->
          Panel.current = 1
        runTest: ->
          doh.assertEqual 'block', $(NavigaterNext.domNode).css('display')
          Panel.slideTo Panel.max 
          deferred = new doh.Deferred()
          setTimeout deferred.getTestCallback( ->
            doh.assertNotEqual 'block', $(NavigaterNext.domNode).css 'display'
            doh.assertEqual 'none', $(NavigaterNext.domNode).css 'display'
          ), 300
          deferred
        timeout: 400
    ]
    
    doh.register "navigater only shows when the Panel has at least one list", [
        name: 'navigater is hidden when panel has only one list'
        runTest: ->
          doh.assertEqual 'none', $(registry.byId('NavigaterPrev_Only_One_list').domNode).css('display')
          doh.assertEqual 'none', $(registry.byId('NavigaterNext_Only_One_list').domNode).css('display')
    ]
    
    doh.run()










