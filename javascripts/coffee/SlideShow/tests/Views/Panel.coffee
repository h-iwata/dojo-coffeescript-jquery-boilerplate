require [
  "doh/runner"
  'dojo/ready'
], (doh, ready) ->
  ready ->
    doh.register "test runner", [
        name:'PanelTest is runnning correctly'
        runTest: ->
          doh.assertTrue(true)
    ]
    doh.run()