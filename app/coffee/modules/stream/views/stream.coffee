define ["jquery", "underscore", "backbone", "js/modules/stream/views/filter", "js/views/elements", "js/views/alerts", "js/modules/stream/collections/posts", "text!html/stream/stream.html", "text!html/items/post.html", "js/models/types", "js/models/settings", "js/models/session", "text!html/404/posts.html"], ($, _, Backbone, vFilter, vElements, vAlerts, cPosts, tStream, tPost, mTypes, mSettings, mSession, posts404) ->

	view = Backbone.View.extend(
	    className: "stream"
	    initialize: ->
	      _.bindAll this
	      mSettings.bind "change", @filter
	      @filter()
	      Backbone.Events.trigger "sidebar", 'default'
	
	    events:
	      "click #customize": "customize"
	      "click #advanced": "advanced"
	
	    customize: (e) ->
	      hidden = (if $("#sidebar").css("display") is "none" then true else false)
	      if hidden is true
	        $("#customize").html "&laquo; Less Options"
	        $("#sidebar").show()
	        $("#stream").css "width", "700px"
	      else
	        $("#customize").html "More Options &raquo;"
	        $("#sidebar").hide()
	        $("#stream").css "width", "100%"
	
      advanced: ->
        $("#filter").toggle()
      
	    filter: ->
	      @collection = new cPosts()
	      self = @
	      $("#mask").show()
	      @collection.fetch
	        success: ->
	          $("#mask").hide()
	          self.update()
	
	        error: (collection, response) ->
	          $("#mask").hide() 
           if response.status is 503
             Backbone.Events.trigger "alert", {type: "error", message: "Stream could not be updated", response: response, location: "modules/stream/views/stream", action: "filter"}
           if response.status is 404
             auth = (_.isUndefined(mSession.get("id")) or _.isUndefined(mSession.get("user_id")) or mSession.get("user_id"))
             if auth is 0
               $("#stream").html "<h2 style='text-align: center'>You must be logged-in to see posts from your friends, followers, and those following you.</h2>"
             else
               $("#stream").html _.template(posts404, {})
	
	
      update: ->
        self = @
        $("#stream").html ""
        _.each @collection.models, (model) ->
          data = model.toJSON()
          unless _.isUndefined(data.meta) 
            data.meta.element = mTypes.get_parent(data.meta.type)
              
            if parseInt(data.stats.thumbs) is 0
              positive = 0
            else
              positive = (parseInt(data.stats.positive) / parseInt(data.stats.thumbs)) * 100 
              
            owner = false
            owner = true if data.user.user.id is mSession.get("user_id")
            $("#stream").append _.template(tPost, {user: data.user.user, meta: data.meta, post: data.post, address: data.user.address[0], stats: data.stats, pic: self.pic, owner: owner, positive: positive, format_date: self.format_date})
	
	
	    render: ->
	      compiled = _.template(tStream, {})
	      @$el.html compiled
	      @subviews "#filter", new vFilter()
	      @el
	  )
	  view
