require [
  "doh/runner"
  "dojo/window"
  "dijit/registry"
  'dojo/ready'
], (doh, win, registry, ready) ->
  ready ->
    
    $('html').scrollTop(0) #set default top position to 0
    
    doh.register "move to target id if clicked", [
      
        name:"move to targetId when the targetId is placed in data-dojo-props",
        runTest: ->
          deferred = new doh.Deferred()
          registry.byId('SmoothScrollToTargetId_0').onClick($.Event( "click" ))
          setTimeout deferred.getTestCallback( ->
            doh.assertNotEqual(0, win.getBox().t)
          ), 200
          deferred
        ,
        timeout: 300,
      ,
        name:"move to top if targetId is empty",
        runTest: ->
          deferred = new doh.Deferred()
          registry.byId('SmoothScrollToTargetId_2').onClick($.Event( "click" ))
          setTimeout deferred.getTestCallback( ->
            doh.assertEqual(0, win.getBox().t)
          ), 200
          deferred
        ,
        timeout: 300,
      ,
        name: 'move to targetId when widget domnode tag is "a" and the href hash is written as #{targetId}',
        runTest: ->
          deferred = new doh.Deferred();
          registry.byId('SmoothScrollToTargetId_1').onClick($.Event( "click" ))
          setTimeout deferred.getTestCallback( ->
            doh.assertNotEqual(0, win.getBox().t);
          ), 200
          deferred;
        ,
        timeout: 300,
      ,
        name: 'move to top when widget domnode tag is "a" and href hash is "#"',
        runTest: ->
          deferred = new doh.Deferred()
          registry.byId('SmoothScrollToTargetId_3').onClick($.Event( "click" ))
          setTimeout deferred.getTestCallback( ->
            doh.assertEqual(0, win.getBox().t);
          ), 200
          deferred
        ,
    ]
    doh.run()
    
