define [
  "dojo/_base/declare" 
  "dijit/_WidgetBase" 
  "dojo/_base/lang"
  "Google/MapAPILoader"
], (declare, _WidgetBase, lang) ->
  declare "Map", [_WidgetBase],
  
    map: null
    center: null
    markers: null
    zoom: 1
    _Bounds: {}
    
    remainedMarker: 1
    renderedMarker: 0
    
    postCreate: ->
      if @center is null
        @destroy()
        return false
      @remainedMarker += @markers.length if @markers isnt null
      
      @map = new google.maps.Map @domNode,
        disableDefaultUI: true
        mapTypeId: google.maps.MapTypeId.ROADMAP
      @_Bounds = new google.maps.LatLngBounds()
      
      new google.maps.Geocoder().geocode
        address: @center
      , lang.hitch(this, @setMarker)
      
      if @markers
        for marker in @markers
          new google.maps.Geocoder().geocode
            address: marker
          , lang.hitch(this, @setMarker)

    setMarker: (result, status) ->
      if status is "OK"
        @renderedMarker++
        new google.maps.Marker
          map: @map
          position: result[0].geometry.location
        @map.fitBounds @_Bounds.extend result[0].geometry.location
      @remainedMarker--
      @postSetMarker() if @remainedMarker is 0 
    
    postSetMarker: ->
      switch @renderedMarker
        when 0 then @destroy()
        when 1 then @map.setOptions zoom: @zoom
    
    destroy: ->
      $(@domNode).parent().remove()
      @inherited arguments
    





















