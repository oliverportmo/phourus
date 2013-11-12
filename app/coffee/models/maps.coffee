define ["jquery", "underscore", "backbone", "async!http://maps.google.com/maps/api/js?sensor=false!callback", "http://google-maps-utility-library-v3.googlecode.com/svn/trunk/markerclusterer/src/markerclusterer.js", "text!html/window.html"], ($, _, Backbone, maps, clusters, tWindow) ->	    
	view = Backbone.View.extend(
        el: '#gmap' 
        
        initialize: (options) ->
          self = @
          _.bindAll @
          Backbone.Events.on "location", @go
          @geocoder = new google.maps.Geocoder()
          @markers = []
          @windows = []
          @latlng = {}   
          @addresses(options)  
         
        addresses: (collection) ->          
          out= []
          for i in collection
            @coordinates i
          out
        
        ### ASYNC CALL ###     
        coordinates: (data) ->
          self = @
          data = data.attributes
          address = data.address[0]  
          str = address.street + ', ' + address.city + ', ' + address.state + ' ' + address.country
          @geocoder.geocode 'address': str, (results, status) -> 
            if status == 'OK'
              key = data.org.id
              loc = results[0].geometry.location
              data.lat = loc.ob
              data.lng = loc.pb 
               
              self.markers[key] = self.createMarkers data  
              self.windows[key] = self.createWindows data
                           
              google.maps.event.addListener self.markers[key], 'click', (event) ->
                self.map.panTo(event.latLng);
                self.map.setZoom(10);
                self.windows[key].open(self.map, self.markers[key]);
            else
              console.log "Geocode was not successful for the following reason: " + status

                      
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
          _.each @locations, (value, key) -> 
            self.markers[key] = self.createMarkers value  
            self.windows[key] = self.createWindows value
                         
            google.maps.event.addListener self.markers[key], 'click', (event) ->
              self.map.panTo(event.latLng);
              self.map.setZoom(10);
              self.windows[key].open(self.map, self.markers[key]);
          _.defer @clusterize
        
        # Create marker for LatLng
        createMarkers: (data) ->
          self = @  
          title = data.org.name
          pos = new google.maps.LatLng(data.lat, data.lng)
          point =
            position: pos
            map: self.map
            #icon: image
            title: title
          new google.maps.Marker(point)
        
        # Create info windows and bind click event
        createWindows: (data) -> 
          self = @
          html = _.template(tWindow, {address: data.address, org: data.org, pic: self.pic})
          @windows[data.org.id] = new google.maps.InfoWindow {content: html}
            
        # Apply clusters to map
        clusterize: ->
           try
             @clusters = new MarkerClusterer(@map, @markers)  
           catch error
             console.log error
        
        # Go to address, zip etc.
        go: (location) -> 
          console.log location
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
          location   
        
               
	)
	view