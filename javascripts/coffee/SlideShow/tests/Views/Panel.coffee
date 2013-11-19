require [
  "doh/runner"
  'dojo/ready'
  'dijit/registry'
], (doh, ready, registry) ->
  ready ->
    Panel = registry.byId('Panel')
    Panel.duration = 10 
    doh.register "slider tests", [
        name: "Panel Can't move if slide To('prev') but current is 0 "
        setUp: ->
          Panel.current = 0
        runTest: ->
          Panel.slideTo 'prev'
          deferred = new doh.Deferred()
          setTimeout deferred.getTestCallback( ->
            doh.assertEqual 0, Panel.current
          ), 40
        timeout: 50
      ,
        name:'Panel should slide to next when SlideTo "next"'
        setUp: ->
          Panel.current = 0
        runTest: ->
          Panel.slideTo 'next'
          deferred = new doh.Deferred()
          setTimeout deferred.getTestCallback( ->
            doh.assertNotEqual 0, Panel.current
            doh.assertEqual 1, Panel.current
          ), 40
          deferred
        timeout: 50
      ,
        name: 'Panel should slide to prev when slideTo "prev"'
        setUp: ->
          Panel.current = 1
        runTest: ->
          Panel.slideTo 'prev'
          deferred = new doh.Deferred()
          setTimeout deferred.getTestCallback( ->
            doh.assertNotEqual 1, Panel.current
            doh.assertEqual 0, Panel.current
          ), 40 
          deferred
        timeout: 50
      ,
        name: "Panel can't slide to next when slideTo 'next' but current length is reached to max"
        setUp: ->
          Panel.current  = Panel.max
        runTest: ->
          Panel.slideTo 'next'
          deferred = new doh.Deferred()
          setTimeout deferred.getTestCallback( ->
            doh.assertEqual Panel.max, Panel.current
            doh.assertNotEqual Panel.max + 1, Panel.current
          ), 40
          deferred
        timeout: 50
      ,
        name: "slideTo 0 from 3"
        setUp: ->
          Panel.current = 3
        runTest: ->
          Panel.slideTo 0 
          deferred = new doh.Deferred()
          setTimeout deferred.getTestCallback( ->
            doh.assertNotEqual 3, Panel.current
            doh.assertEqual 0,Panel.current
          ), 40
          deferred
        timeout: 51

    ]
    
    
    doh.run()
