define [
  "doh/runner"
], (doh) ->
  doh.register 'HelloDojoButton', require.toUrl("App/tests/Views/testHelloDojoButton.html"), 999999
