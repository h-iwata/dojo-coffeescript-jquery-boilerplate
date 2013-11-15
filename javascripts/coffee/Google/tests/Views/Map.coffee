require [
  "doh/runner"
  'dijit/registry'
  'dojo/aspect'
  'dojo/ready'
], (doh, registry, aspect, ready) ->
  
  ready ->
    
    doh.register "widget is destroyed", [
        name: "if @center is empty",
        runTest: ->
          doh.assertEqual 0, $('#empty-property-of-center').length
      ,
        name: "if @center is set but invalid address",
        runTest: ->
          deferred = new doh.Deferred()
          doh.assertFalse registry.byId('invalid-address').markerDetected
          aspect.after registry.byId('invalid-address'), 'destroy', deferred.getTestCallback ->
            doh.assertEqual 0, $('#invalid-address').length
          deferred
        timeout:8000
    ]
    
    doh.register "widget render correctly", [
        name: 'if @center is set',
        runTest: ->
          deferred = new doh.Deferred()
          aspect.after registry.byId('set-center-only'), 'postSetMarker', deferred.getTestCallback ->
            doh.assertEqual 1, registry.byId('set-center-only').renderedMarker
            doh.assertEqual 1, $('#set-center-only').length
          deferred
        timeout: 8000
      ,
        name: 'if @center and @markers is set '
        runTest: ->
          deferred = new doh.Deferred()
          aspect.after registry.byId('set-markers-auto-resize'), 'postSetMarker', deferred.getTestCallback ->
            doh.assertTrue registry.byId('set-markers-auto-resize').renderedMarker
            doh.assertEqual 1, $('#set-markers-auto-resize').length
          deferred
        timeout: 8000
      ,
        name: "render map if at least one address is set in @markers or @center"
        runTest: ->
          deferred = new doh.Deferred()
          aspect.after registry.byId('set-invalid-marker'), 'postSetMarker', deferred.getTestCallback ->
            doh.assertEqual 1, $('#set-invalid-marker').length
          deferred
        timeout: 8000
    ]
    
    doh.run()
    

















