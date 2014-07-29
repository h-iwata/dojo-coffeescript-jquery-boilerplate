require [
  "doh/runner"
  'dojo/ready'
], (doh, ready) ->
  ready ->
    doh.register "test runner", [
        name:'FeedTest is runnning correctly'
        runTest: ->
          doh.assertTrue(true)
    ]
    doh.run()