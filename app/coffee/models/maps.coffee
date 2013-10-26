define ["jquery", "underscore", "backbone", "async!http://maps.google.com/maps/api/js?sensor=false!callback", "http://google-maps-utility-library-v3.googlecode.com/svn/trunk/markerclusterer/src/markerclusterer.js", "text!html/window.html"], ($, _, Backbone, maps, clusters, tWindow) ->
	raw = 
	  0: 
	    address: "1776 California St, Mountain View CA 94041"
	    name: "ABC Company"
	    lat: 37.396229
	    lng: -122.091926
	  1: 
	    address: "5 Lewis Lane, East Hampstead NH 03826"
	    name: "DEF Company"
	    lat: 42.8910476
	    lng: -71.13239659999999
	  2: 
	    address: "63 Fountain St, Haverhill MA 01830"
	    name: "XYZ Company"
	    lat: 42.7855423
	    lng: -71.07526940000002
	  3: 
	    address: "923 Baywood Drive, Newport Beach CA 92660" 
	    name: "KLI Company"
	    lat: 39.1211965
	    lng: -104.1678933
	  4: 
	    address: "1 Main St, Colorado Springs CO"
	    name: "CBA Company"
	    lat: 33.6133044
	    lng: -117.86344020000001
	    
	data= [raw[0], raw[1], raw[2], raw[3], raw[4]]
	view = Backbone.View.extend(
        el: '#gmap' 
        
        initialize: (options) ->
          self = @
          _.bindAll @
          Backbone.Events.on "location", @go
          @geocoder = new google.maps.Geocoder()
          @options.locations = options 
          @markers = []
          @windows = []
          @latlng = {}     
                         
        render: () ->
          @config = 
            zoom: 4
            center: new google.maps.LatLng(38, -95)
            mapTypeId: google.maps.MapTypeId.ROADMAP
        
          container= document.getElementById('gmap')
          @map = new google.maps.Map container, @config unless container is null
          @start()           
        
        # Loop through locations in data
        start: ->
          self = @  
          locs = @options.locations     
          _.each @options.locations, (value, key) -> 
            self.markers[key] = self.createMarkers value  
            self.windows[key] = self.createWindows value
                         
            google.maps.event.addListener self.markers[key], 'click', (event) ->
              self.map.panTo(event.latLng);
              self.map.setZoom(10);
              self.windows[key].open(self.map, self.markers[key]);
          _.defer @clusterize

        # Create marker for LatLng
        createMarkers: (location) ->
          self = @  
          pos = new google.maps.LatLng(location.lat, location.lng)
          point =
            position: pos
            map: self.map
            #icon: image
            title: location.name
          new google.maps.Marker(point)
        
        # Create info windows and bind click event
        createWindows: (location) -> 
          self = @
          html = _.template(tWindow, {data: location})
          @windows[location.id] = new google.maps.InfoWindow {content: html}
            
        # Apply clusters to map
        clusterize: ->
           try
             @clusters = new MarkerClusterer(@map, @markers)  
           catch error
             console.log error
        
        # Go to address, zip etc.
        go: (location) -> 
          self = @
          out = {}
          g = new google.maps.Geocoder()
          g.geocode 'address': location, (results, status) -> 
            if status == 'OK'
              loc = results[0].geometry.location
              self.map.setZoom(6)
              self.map.panTo(loc)
            else
              console.log "Geocode was not successful for the following reason: " + status
              console.log location
          location   
        
        ### ASYNC CALL ###     
        coordinates: (data, id) ->
          self = @
          @geocoder.geocode 'address': data.address, (results, status) -> 
            if status == 'OK'
              out = {}
              loc = results[0].geometry.location
              out.lat = loc.jb
              out.lng = loc.kb 
              console.log out
              self.latlng[id] = out
            else
              console.log "Geocode was not successful for the following reason: " + status
               
	)
	view