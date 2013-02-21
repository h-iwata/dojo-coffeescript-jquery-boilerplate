#debug functions
define [], ->
  window.show = (obj) ->
    console.log(obj)
  
  window.var_dump  = (obj) ->
    require [
      "jquery/plugins/Prettyprint"
    ], ->
      tbl = PrettyPrint(obj)
      $(document.body).append tbl
  