require [
  "doh/runner"
  'dojo/ready'
  'dijit/registry'
  'dojo/aspect'
], (doh, ready, registry, aspect) ->
  ready ->
    doh.register "get Feeds correctly", [
        name: 'feeds are set in the Widget ',
        runTest: ->
          deferred = new doh.Deferred()
          aspect.after registry.byId('news'), 'setEntries', deferred.getTestCallback ->
            doh.assertEqual 4, $("#news").children().length
          deferred
        timeout: 400
      ,
        name: 'you can set the size',
        runTest: ->
          deferred = new doh.Deferred()
          aspect.after registry.byId('length-is-2'), 'setEntries', deferred.getTestCallback ->
            console.log $("#length-is-2").children().length
            doh.assertEqual 2, $("#length-is-2").children().length
          deferred
        timeout: 8000
    ]
    doh.run()