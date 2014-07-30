require [
  "doh/runner"
  'dojo/ready'
  'Google/Feed'
], (doh, ready, Feed) ->
  ready ->
    doh.register "test runner", [
        name:'getEntries returns entry sets'
        runTest: ->
          Feed.getEntries("http://web-programmers-blog.com/feed/").then (results) ->
            doh.assertNotEqual(results.length, 0)
        timeout:8000
      ,
        name:'you can set size'
        runTest: ->
          Feed.getEntries("http://web-programmers-blog.com/feed/", 1).then (results) ->
            doh.assertEqual(results.length, 1)
      ,
        name:'set error handler in the second argument'
        runTest: ->
          Feed.getEntries("invalid-url.com").then (results) ->
            doh.assertTrue(false)
          , (error) ->
            doh.assertEqual(error.code, 400)
            doh.assertEqual(error.message, "The specified feed URL is invalid")
    ]
    doh.run()
    





















