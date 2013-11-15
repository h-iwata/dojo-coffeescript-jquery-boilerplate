require [
  "doh/runner"
  'dojo/ready'
], (doh, ready) ->
  ready ->
    doh.register "scroll test", [ 
      name : 'add class "fixed" when scroll down over 39'
      runTest : ->
        doh.assertFalse $('#contentNavigation').hasClass('fixed') 
        $('html').scrollTop 40
        setTimeout ->
          doh.assertTrue $('#contentNavigation').hasClass('fixed')
        , 1600
    ]
    doh.run()
