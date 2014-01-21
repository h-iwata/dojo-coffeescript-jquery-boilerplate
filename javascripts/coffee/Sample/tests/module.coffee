define [
  "doh/runner"
], (doh) ->
  doh.register 'Sample', require.toUrl("/javascripts/coffee/Sample/tests/Views/SmoothScrollToTargetId.html"), 999999
  doh.register 'ToggleTargetHideClassBUtton', require.toUrl('/javascripts/coffee/Sample/tests/Views/ToggleTargetHideClassBUtton.html'), 999999
  doh.register 'PositionFixedUnlessScrollOnTop', require.toUrl('/javascripts/coffee/Sample/tests/Views/PositionFixedUnlessScrollOnTop.html'), 999999
  doh.register 'Views/CopyInnerDOMToTargetId', require.toUrl('/javascripts/coffee/Sample/tests/Views/Views/CopyInnerDOMToTargetId.html'), 999999
  doh.register 'CopyDomToTargetId', require.toUrl('/javascripts/coffee/Sample/tests/Views/CopyDomToTargetId.html'), 999999
  doh.register 'CopyInnerDomToTargetId', require.toUrl('/javascripts/coffee/Sample/tests/Views/CopyInnerDomToTargetId.html'), 999999
  doh.register 'LazyLoad', require.toUrl('/javascripts/coffee/Sample/tests/Views/LazyLoad.html'), 999999
