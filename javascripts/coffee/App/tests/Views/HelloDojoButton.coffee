require [
  "doh/runner", 'dojo/ready'
], (doh,ready) ->
  ready ->
    doh.register "on click", [
        name:'append "p" tag to after the widget dom node'
        runTest: ->
          $('#HelloDojoButton_0').trigger('click')
          doh.assertTrue($('#HelloDojoButton_0').next().is('p'))
          $('#HelloDojoButton_0').next().remove();
      ,
        name:'the message in the data-dojo-props will be shown in the next "p" tag'
        runTest: ->
          $('#HelloDojoButton_0').trigger('click')
          doh.assertEqual('hello dojo!!', $('#HelloDojoButton_0').next().text())
          $('#HelloDojoButton_0').next().remove()
    ]
    doh.run();
		

