define ["jquery", "underscore", "backbone", "text!html/orgs/shared/posts.html", "js/modules/orgs/collections/community", "js/views/alerts", "js/models/types", "text!html/orgs/shared/users.html", "text!html/orgs/shared/user.html", "text!html/404/users.html"], ($, _, Backbone, template, cCommunity, vAlerts, mTypes, tUsers, tUser, users404) ->
  widget = Backbone.View.extend(
    
    initialize: (options) ->
      self = @
      params = {}
      params.org_id = options.id
      params.type = options.page.slice(0,-1)
      params.mode = 'full' 
      $("#mask").show()
      @collection = new cCommunity(params)
      @collection.fetch
        success: ->
          $("#mask").hide()
          self.render()

        error: (collection, response) ->
          $("#mask").hide()
          if response.status is 404
            self.$el.html _.template(users404, {})
          else
            Backbone.Events.trigger "alert", {type: "error", message: "Users could not be loaded", response: response, location: "modules/orgs/shared/users", action: "read"}
          
    render: ->
      self = @
      l = @collection.models.length
      compiled = _.template(tUsers, '')
      $(self.el).append compiled
      if l is 0
        $(self.el).append '<h3 style="text-align: center;margin: 0px; padding: 0px">No users were found based on your criteria</h3>'
      _.each @collection.models, (model) ->
        user = model.toJSON()
        user.influence = 48
        $(self.el).append _.template(tUser, {user: user, pic: self.pic})
      @$el
      
  )
  widget
