define ["jquery", "underscore", "backbone", "text!html/widgets/posts.html", "js/modules/orgs/collections/reviews", "js/views/alerts", "js/models/types", "text!html/orgs/shared/review.html"], ($, _, Backbone, template, cReviews, vAlerts, mTypes, tReview) ->
  widget = Backbone.View.extend(
    
    initialize: (options) ->
      self = @
      options.id = 1;
      options.page = 1;
      options.limit = 10;
      @collection = new cReviews(options)
      @collection.fetch
        success: ->
          
          self.render()

        error: (collection, response) ->
	        Backbone.Events.trigger {response: response, location: "modules/orgs/shared/reviews", action: "read", type: "error"}
          
    render: ->
      self = @
      _.each @collection.models, (model) ->
        review = model.toJSON()
        $(self.el).append _.template(tReview, {data: review, pic: self.pic})
      @$el
      
  )
  widget
