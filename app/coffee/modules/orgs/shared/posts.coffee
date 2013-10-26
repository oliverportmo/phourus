define ["jquery", "underscore", "backbone", "text!html/widgets/posts.html", "js/modules/orgs/collections/posts", "js/views/alerts", "js/models/types", "text!html/stream/post.html"], ($, _, Backbone, template, cPosts, vAlerts, mTypes, tPost) ->
  widget = Backbone.View.extend(
    
    initialize: (options) ->
      self = @
      options.types = options.page
      @collection = new cPosts(options)
      @collection.fetch
        success: ->
          self.render()

        error: (collection, response) ->
	        Backbone.Events.trigger {response: response, location: "modules/orgs/shared/posts", action: "read", type: "error"}
          
    render: ->
      self = @
      _.each @collection.models, (model) ->
        data = model.toJSON()
        data.meta.element = mTypes.get_parent(data.meta.type)
        $(self.el).append _.template(tPost, {post: data.post, meta: data.meta, address: data.address, stats: data.stats, user: data.user})
      @$el
      
  )
  widget
