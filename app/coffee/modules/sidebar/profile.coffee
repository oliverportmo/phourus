define ["jquery", "underscore", "backbone", "text!html/sidebar/profile.html", "js/models/types", "js/models/session", "js/models/follow"], ($, _, Backbone, template, mTypes, mSession, model) ->
   
  view = Backbone.View.extend(
    el: "#sidebar"
    clasName: "profile"
    
    initialize: (options) ->
      self = @
      params = {}
      params.target_id = options.user 
      params.user_id = mSession.get("user_id")
      @model = new model(params)
      @model.fetch
        success: (model, response) ->
          if response.length > 1
            Backbone.Events.trigger "alert", {type: "error", message: "Duplicate follow found", response: response, location: "modules/sidebar/profile", action: "read"}
          else
            self.following = 1
            self.render()
        error: (model, response) ->            
          if response.status is 404
            self.following = 0
            self.render()
          else
            Backbone.Events.trigger "alert", {type: "message", message: "There was an error loading follow info", response: response, location: "modules/sidebar/profile", action: "read"}
            
    events:
      "click .follow": "follow"
      "click .unfollow": "unfollow"
    
    follow: () ->
      console.log 'follow'
      #@model = new model({user_id: mSession})
      ###
      @model.save data, 
        success: (model, response) ->
  
        error: (model, response) ->
      ###
            
    unfollow: () ->
      console.log @model
      ###
      @model.destroy {user_id: , 
        success: (model, response) ->

        error: (model, response) ->
      ###
      
    render: ->
      data = {}
      data.authorized = 0
      data.following = @following
      compiled = _.template(template, {data: data})
      $(@el).append compiled
      compiled
      
  )
  view