define ["jquery", "underscore", "backbone", "js/modules/stream/models/post", "text!html/stream/post.html", "text!html/headings/post.html", "js/models/types", "js/models/session", "js/modules/stream/views/interact", "text!html/404/post.html"], ($, _, Backbone, model, template, tHeading, mTypes, mSession, vInteract, post404) ->
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
      params = {id: id}
      $("#mask").show()
      Backbone.Events.trigger "sidebar", {type: "default", params: params}
      @model = new model({id: id})
      self = this
      @model.fetch 
        success: ->
          $("#mask").hide()
          self.render()
          
        error: (model, response) ->
	          $("#mask").hide()
	          if response.status is 404
	            self.$el.html _.template(post404, {})
	            #Backbone.Events.trigger "alert", {type: "message", message: "Post could not be found", response: response, location: "modules/stream/views/single", action: "read"}
	          if response.status is 503
	            Backbone.Events.trigger "alert", {type: "error", message: "Post could not be loaded", response: response, location: "modules/stream/views/single", action: "read"}

    render: -> 
      data = @model.toJSON()
      unless _.isUndefined(data.meta)
        type = data.meta.type
        element = mTypes.get_parent(type)
        
        owner = data.meta.user_id is mSession.get("user_id")
        params = {address: data.user.address[0], meta: data.meta, post: data.post, stats: data.stats, user: data.user.user, element: element, owner: owner, pic: @pic, format_date: @format_date}
        compiled = _.template(template, params)
        @$el.html compiled
        heading = _.template(tHeading, params)
        $(".heading").html heading  
        @subviews "#interact", new vInteract(@options)
        compiled
  )
  view
