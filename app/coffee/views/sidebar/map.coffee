define ["jquery", "underscore", "backbone", "text!html/sidebar/map.html"], ($, _, Backbone, template) ->
  raw = 
    "arizona": 21
    "california": 25
    "colorado": 13
    "massachusetts": 27
    "new hampshire": 7
   
  view = Backbone.View.extend(
    el: "#sidebar"
    className: "map"
    
    initialize: (options) ->
      @render()
      
    events:
      "click a": "select"
      "click button#zipcode": "zip"
    
    select: (e) ->
      Backbone.Events.trigger "location", e.currentTarget.id
    
    zip: (e) ->
      Backbone.Events.trigger "location", $("input#zip").val()
        
    render: ->
      data = {}
      data.regions = raw
      compiled = _.template(template, {data: data})
      $(@el).append compiled
      compiled
      
  )
  view