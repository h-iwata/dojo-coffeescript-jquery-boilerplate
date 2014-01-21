require [
  "doh/runner"
  'dojo/ready'
], (doh, ready) ->
  ready ->
    //TODO: tests will be added
    doh.register "test runner", [
        name:'LazyLoadTest is runnning correctly'
        runTest: ->
          doh.assertTrue(true)
    ]
    doh.run()
