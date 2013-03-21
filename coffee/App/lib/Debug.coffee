#debug functions
define [], ->
  window.show = (obj) ->
    console.log(obj)
  
  window.var_dump  = (obj) ->
    require [
      "lib/jquery/plugins/Prettyprint"
    ], ->
      tbl = PrettyPrint(obj)
      $(document.body).append tbl
  