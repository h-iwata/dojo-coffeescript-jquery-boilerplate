define [
  "doh/runner"
], (doh) ->
  doh.register 'Sample', require.toUrl("/javascripts/coffee/Sample/tests/Views/SmoothScrollToTargetId.html"), 999999
  doh.register 'ToggleTargetHideClassBUtton', require.toUrl('/javascripts/coffee/Sample/tests/Views/ToggleTargetHideClassButton.html'), 999999
  doh.register 'PositionFixedUnlessScrollOnTop', require.toUrl('/javascripts/coffee/Sample/tests/Views/PositionFixedUnlessScrollOnTop.html'), 999999
  doh.register 'CopyInnerDomToTargetId', require.toUrl('/javascripts/coffee/Sample/tests/Views/CopyInnerDomToTargetId.html'), 999999
  doh.register 'LazyLoad', require.toUrl('/javascripts/coffee/Sample/tests/Views/LazyLoad.html'), 999999
  doh.register 'OpenSNSWindow', require.toUrl('/javascripts/coffee/Sample/tests/Views/OpenSNSWindow.html'), 999999
  doh.register 'Tree', require.toUrl('/javascripts/coffee/Sample/tests/Views/Tree.html'), 999999
