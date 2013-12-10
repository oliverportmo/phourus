define ["jquery", "underscore", "backbone", "text!html/widgets/posts.html", "js/modules/orgs/collections/reviews", "js/views/alerts", "js/models/types", "text!html/orgs/shared/review.html", "text!html/404/reviews.html"], ($, _, Backbone, template, cReviews, vAlerts, mTypes, tReview, reviews404) ->
  widget = Backbone.View.extend(
    
    initialize: (options) ->
      self = @
      $("#mask").show()
      options.id = options.id;
      options.page = 1;
      options.limit = 10;
      @collection = new cReviews(options)
      @collection.fetch
        success: ->
          $("#mask").hide()
          self.render()

        error: (collection, response) ->
	        $("#mask").hide()
	        if response.status is 404
	         self.$el.html _.template(reviews404, {})
	        else
	         Backbone.Events.trigger "alert", {type: "error", message: "Reviews could not be loaded", response: response, location: "modules/orgs/shared/reviews", action: "read"}
          
    render: ->
      self = @
      _.each @collection.models, (model) ->
        data = model.toJSON()
        $(self.el).append _.template(tReview, {review: data.review, pic: self.pic, user: data.user.user, format_date: self.format_date})
      @$el
      
  )
  widget
