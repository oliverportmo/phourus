define ["jquery", "underscore", "backbone", "text!html/sidebar/post.html", "js/models/types", "js/modules/sidebar/widgets/recent", "js/modules/sidebar/widgets/create", "js/models/thumb", "js/models/session"], ($, _, Backbone, template, mTypes, vRecent, vCreate, model, mSession) ->
   
  view = Backbone.View.extend(
    el: "#sidebar"
    clasName: "post"
    
    initialize: (options) ->
      self = @
      params = {}
      params.post_id = options.id 
      params.user_id = mSession.get("user_id")
      @model = new model(params)
      @model.fetch
        success: (model, response) ->
          if response.length > 1
            Backbone.Events.trigger "alert", {type: "error", message: "Duplicate thumbs found", response: response, location: "modules/sidebar/post", action: "read"}
          else
            self.render()
        error: (model, response) ->            
          if response.status is 404
            self.render()
          else
            Backbone.Events.trigger "alert", {type: "message", message: "There was an error loading thumbs", response: response, location: "modules/sidebar/post", action: "read"}
            
    events:
      "click #plus": "thumb"
      "click #minus": "thumb"
    
    thumb: (e) ->
      id = e.currentTarget.id
      if id is 'minus'
        positive = 0
      else if id is 'plus'
        positive = 1
      else
        return
      
      @send positive
 
    send: (positive) ->
      data = {}
      data.positive = positive
      data.user_id = mSession.get("user_id")
      data.post_id = @options
      
      if data.user_id is 0
        # you must be logged in display?
      else
        @model = new model()
        @model.save data, 
          success: (model, response) ->

          error: (model, response) ->
    
    render: ->
      m = @model.attributes unless _.isUndefined(@model.attributes)
      data = {}
      data.positive = -1
      if !_.isUndefined(m[0])
        data.positive = m[0].positive unless _.isUndefined(m[0].positive)
      compiled = _.template(template, {data: data})
      $(@el).append compiled
      #@subviews "#recent", new vRecent()
      @subviews "#create", new vCreate()
      compiled
      
  )
  view