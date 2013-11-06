define ["jquery", "underscore", "backbone", "js/modules/stream/models/post", "text!html/stream/post.html", "text!html/headings/post.html", "js/models/types", "js/models/session", "js/modules/stream/views/interact"], ($, _, Backbone, model, template, tHeading, mTypes, mSession, vInteract) ->
  view = Backbone.View.extend(
    
    className: "post"
    
    initialize: (options) ->
      _.bindAll @
      @load options.id

    events: 
      "click .back": "back"
    
    back: ->
      Backbone.Events.trigger "back", {}
    
    load: (id) ->
      Backbone.Events.trigger "sidebar", "single"
      @model = new model({id: id})
      self = this
      @model.fetch 
        success: ->
          self.render()
          
        error: (model, response) ->
	          if response.status is 404
	            self.$el.html '<h2 style="text-align: center">Post not found</h2>';
	            Backbone.Events.trigger "alert", {type: "message", message: "Post could not be found", response: response, location: "modules/stream/views/single", action: "read"}
	          if response.status is 503
	            Backbone.Events.trigger "alert", {type: "error", message: "Post could not be loaded", response: response, location: "modules/stream/views/single", action: "read"}

    render: -> 
      data = @model.toJSON()
      unless _.isUndefined(data.meta)
        type = data.meta.type
        element = mTypes.get_parent(type)
        
        owner = data.meta.user_id is mSession.get("user_id")
        params = {address: data.address[0], meta: data.meta, post: data.post, stats: data.stats, user: data.user, element: element, owner: owner, pic: @pic, format_date: @format_date}
        compiled = _.template(template, params)
        @$el.html compiled
        heading = _.template(tHeading, params)
        $(".heading").html heading  
        @subviews "#interact", new vInteract(@options)
        compiled
  )
  view
