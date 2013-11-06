define ["jquery", "underscore", "backbone", "js/modules/stream/collections/comments", "text!html/stream/interact.html", "js/modules/stream/views/comment", "js/models/types", "js/models/session"], ($, _, Backbone, collection, template, vComment, mTypes, mSession) ->
  view = Backbone.View.extend(
    
    initialize: (options) ->
      _.bindAll @  
      @options = options 
    
    events: 
      "click button#test": "test"
    
    render: () ->
      session = mSession.toJSON()
      compiled = _.template(template, {session: session, pic: @pic, user: session.user})
      @$el.append compiled
      @comments()
      @

    comments: () ->
      self = this
      post_id = @options.id
      @collection = new collection()
      @collection.post_id = post_id
      @collection.fetch 
        success: (collection, response) ->
          _.each collection.models, (obj, key) ->
            v = new vComment()
            $("#comments").append v.render(obj).el
          
        error: (model, response) ->
	          if response.status is 404
	            self.$el.html '<h2 style="text-align: center">There are no comments for this post</h2>';
	          if response.status is 503
	            Backbone.Events.trigger "alert", {type: "error", message: "Comments could not be loaded", response: response, location: "modules/stream/views/interact", action: "read"}

  )
  view
