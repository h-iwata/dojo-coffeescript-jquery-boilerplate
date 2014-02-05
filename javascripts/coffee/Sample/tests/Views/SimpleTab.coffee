require [
  "doh/runner"
  'dojo/ready'
], (doh, ready) ->
  ready ->
    #TODO:addTests
    doh.register "test runner", [
        name:'SimpleTabTest is runnning correctly'
        runTest: ->
          doh.assertTrue(true)
    ]
    doh.run()