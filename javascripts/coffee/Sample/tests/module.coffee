define [
  "doh/runner"
], (doh) ->
  doh.register 'Sample', require.toUrl("/javascripts/coffee/Sample/tests/Views/SmoothScrollToTargetId.html"), 999999
  doh.register 'ToggleTargetHideClassBUtton', require.toUrl('/javascripts/coffee/Sample/tests/Views/ToggleTargetHideClassBUtton.html'), 999999
  doh.register 'PositionFixedUnlessScrollOnTop', require.toUrl('/javascripts/coffee/Sample/tests/Views/PositionFixedUnlessScrollOnTop.html'), 999999
