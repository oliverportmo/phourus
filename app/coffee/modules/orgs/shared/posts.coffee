define ["jquery", "underscore", "backbone", "text!html/widgets/posts.html", "js/modules/orgs/collections/posts", "js/models/types", "text!html/items/post.html"], ($, _, Backbone, template, cPosts, mTypes, tPost) ->
  widget = Backbone.View.extend(
    
    initialize: (options) ->
      self = @
      options.types = options.page
      @collection = new cPosts(options)
      @collection.fetch
        success: ->
          self.render()

        error: (collection, response) ->
          if response.status is 404
            $(self.el).append '<h3 style="text-align: center;margin: 0px; padding: 0px">No posts were found based on your criteria</h3>'
          if response.status is 503
            Backbone.Events.trigger "alert", {type: "error", message: "Posts could not be loaded", response: response, location: "modules/orgs/shared/posts", action: "read"}
          
    render: ->
      self = @
      l = @collection.models.length
      if l is 0
        $(self.el).append '<h3 style="text-align: center;margin: 0px; padding: 0px">No posts were found based on your criteria</h3>'
      else
        _.each @collection.models, (model) ->
          data = model.toJSON()
          data.meta.element = mTypes.get_parent(data.meta.type)
          $(self.el).append _.template(tPost, {post: data.post, meta: data.meta, owner: false, address: data.address, stats: data.stats, user: data.user.user, pic: self.pic})
      @$el
      
  )
  widget
