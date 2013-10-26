define ["jquery", "underscore", "backbone", "js/modules/stream/views/filter", "js/views/elements", "js/views/alerts", "js/modules/stream/collections/posts", "text!html/stream/stream.html", "text!html/stream/post.html", "js/models/types", "js/models/settings"], ($, _, Backbone, vFilter, vElements, vAlerts, cPosts, tStream, tPost, mTypes, mSettings) ->

	view = Backbone.View.extend(
	    className: "stream"
	    initialize: ->
	      _.bindAll this
	      mSettings.bind "change", @filter
	      @filter()
	      Backbone.Events.trigger "sidebar", 'stream'
	
	    events:
	      "click #customize": "customize"
	
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
	
	    filter: ->
	      @collection = new cPosts()
	      self = @
	      @collection.fetch
	        success: ->
	          self.update()
	
	        error: (collection, response) ->
	          Backbone.Events.trigger {response: response, location: "modules/stream/views/stream", action: "filter", type: "error"}
	
	
	    update: ->
	      self = @
	      $("#stream").html ""
	      _.each @collection.models, (model) ->
	        data = model.toJSON()
	        data.meta.element = mTypes.get_parent(data.meta.type)
	        $("#stream").append _.template(tPost, {user: data.user, meta: data.meta, post: data.post, address: data.address, pic: self.pic})
	
	
	    render: ->
	      compiled = _.template(tStream, {})
	      @$el.html compiled
	      @subviews "#filter", new vFilter()
	      @el
	  )
	  view
