require [
  "doh/runner"
  'dojo/ready'
  'dijit/registry'
], (doh, ready, registry) ->
  ready ->
    doh.register "copy inner dom", [
        name:'copy single dom correctly'
        runTest: ->
          doh.assertTrue $('#CopyInnerDomToTargetId1').children()[0].tagName == $('#target1').children()[0].tagName
          doh.assertTrue $('#CopyInnerDomToTargetId1').children()[0].text == $('#target1').children()[0].text
    ]
    doh.run()
