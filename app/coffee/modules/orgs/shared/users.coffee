define ["jquery", "underscore", "backbone", "text!html/orgs/shared/posts.html", "js/modules/orgs/collections/community", "js/views/alerts", "js/models/types", "text!html/orgs/shared/users.html", "text!html/orgs/shared/user.html"], ($, _, Backbone, template, cCommunity, vAlerts, mTypes, tUsers, tUser) ->
  widget = Backbone.View.extend(
    
    initialize: (options) ->
      self = @
      params = {}
      params.org_id = options.id
      params.type = options.page.slice(0,-1)
      params.mode = 'full' 
      
      @collection = new cCommunity(params)
      @collection.fetch
        success: ->
          self.render()

        error: (collection, response) ->
	        Backbone.Events.trigger {response: response, location: "modules/orgs/shared/users", action: "read", type: "error"}
          
    render: ->
      self = @
      compiled = _.template(tUsers, '')
      $(self.el).append compiled
      _.each @collection.models, (model) ->
        user = model.toJSON()
        user.influence = 48
        $(self.el).append _.template(tUser, {user: user, pic: self.pic})
      @$el
      
  )
  widget
