define [
  "doh/runner"
], (doh) ->
  doh.register 'Sample', require.toUrl("/javascripts/coffee/Sample/tests/Views/SmoothScrollToTargetId.html"), 999999
