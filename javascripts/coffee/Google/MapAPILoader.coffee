#空の関数をグローバルに指定することでAMDモードになる
(->
  callback = ->
  callbackName = "gmapscallback" + (new Date()).getTime()
  window[callbackName] = callback
  define ["//maps.googleapis.com/maps/api/js?sensor=true&callback=" + callbackName], -> google.maps
)()
