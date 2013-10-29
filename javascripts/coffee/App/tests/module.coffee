define [
  "doh/runner"
], (doh) ->
  doh.register 'HelloDojoButton', require.toUrl("/javascripts/coffee/App/tests/Views/HelloDojoButton.html"), 999999
