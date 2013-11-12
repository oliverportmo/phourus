define ["jquery", "underscore", "backbone", "text!html/sidebar/map.html", "js/models/special", "js/models/types"], ($, _, Backbone, template, mSpecial, mTypes) ->
   
  view = Backbone.View.extend(
    el: "#sidebar"
    className: "map"
    
    initialize: (options) ->
      @options = {}
      @options.type = options.type
      @options.mode = "states"
      @states = mTypes.states
      @render()
      
    events:
      "click a": "select"
      "click button#zipcode": "zip"
    
    select: (e) ->
      Backbone.Events.trigger "location", e.currentTarget.id
    
    zip: (e) ->
      Backbone.Events.trigger "location", $("input#zip").val()
        
    render: ->
      self = @
      @model = new mSpecial(@options)
      @model.fetch
        success: (model, response) ->
          self.display(response)
        error: (model, response) ->
          self.generic()
       
    display: (response) ->   
      compiled = _.template(template, {data: response, states: @states})
      $(@el).append compiled
      compiled
    
    generic: ->  
      compiled = _.template(template, {data: @states, states: @states})
      $(@el).append compiled
      compiled
  )
  view