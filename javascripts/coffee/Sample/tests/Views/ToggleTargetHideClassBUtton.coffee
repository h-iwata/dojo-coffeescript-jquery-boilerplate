require [
  "doh/runner"
  'dojo/ready'
  'dijit/registry'
], (doh, ready, registry) ->
  ready ->

    ToggleTargetHideClassButton = registry.byId('ToggleTargetHideClassButton_0')

    doh.register "test runner", [
        name: "onClick: the hide class is add to target dom  if target class doesn't have hide"
        runTest: ->
          ToggleTargetHideClassButton.onClick()
          doh.assertEqual 'hide', $(ToggleTargetHideClassButton.target).attr('class')
      ,
        name: 'onClick: the hide class is removed if target class has hide'
        runTest: ->
          ToggleTargetHideClassButton.onClick()
          doh.assertEqual '', $(ToggleTargetHideClassButton.target).attr 'class'
    ]
    doh.run()
