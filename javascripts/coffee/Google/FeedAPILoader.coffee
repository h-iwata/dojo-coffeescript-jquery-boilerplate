define ["//www.google.com/jsapi"], ->
  #空の関数をグローバルに指定することでAMDモードになる
  callbackName = "gmapscallback#{(new Date()).getTime()}"
  window[callbackName] = ->
  google.load "feeds", "1",  
    "callback" : callbackName
    nocss:true
    nooldnames:true
