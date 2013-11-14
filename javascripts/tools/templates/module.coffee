define [
  "doh/runner"
], (doh) ->
  doh.register '#{PackageName}', require.toUrl("/javascripts/coffee/#{PackageName}/tests/Views/#{WidgetName}.html"), 999999
