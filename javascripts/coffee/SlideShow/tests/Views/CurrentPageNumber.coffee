require [
  "doh/runner"
  'dojo/ready'
  "dijit/registry"
], (doh, ready, registry) ->
  ready ->
    CurrentPageNumber = registry.byId('CurrentPageNumber')
    Panel = registry.byId(CurrentPageNumber.panelId)
    Panel.duration = 10
    doh.register "aop works fine", [
        name:'show current number after slideTo 3'
        runTest: ->
          doh.assertEqual 1, $(CurrentPageNumber.domNode).html()
          Panel.slideTo 3
          deferred = new doh.Deferred()
          setTimeout deferred.getTestCallback( ->
            doh.assertNotEqual 1, $(CurrentPageNumber.domNode).html()
            doh.assertEqual 4, $(CurrentPageNumber.domNode).html()
          ), 20
          deferred
        timeout: 30
    ]
    doh.run()
