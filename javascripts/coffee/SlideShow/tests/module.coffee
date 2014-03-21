define [
  "doh/runner"
], (doh) ->
  doh.register 'Panel', require.toUrl('/javascripts/coffee/SlideShow/tests/Views/Panel.html', 999999)
  doh.register 'SlideShow', require.toUrl("/javascripts/coffee/SlideShow/tests/Views/Panel.html"), 999999
  doh.register 'Navigater', require.toUrl('/javascripts/coffee/SlideShow/tests/Views/Navigater.html'), 999999
  doh.register 'CurrentPageNumber', require.toUrl('/javascripts/coffee/SlideShow/tests/Views/CurrentPageNumber.html'), 999999
