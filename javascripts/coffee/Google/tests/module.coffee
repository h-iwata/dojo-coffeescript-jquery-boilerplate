define [
  "doh/runner"
], (doh) ->

  doh.register 'Map', require.toUrl('/javascripts/coffee/Google/tests/Views/Map.html'), 999999
  doh.register 'Feed', require.toUrl('/javascripts/coffee/Google/tests/Views/Feed.html'), 999999
