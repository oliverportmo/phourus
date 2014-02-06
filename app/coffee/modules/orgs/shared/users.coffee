define ["jquery", "underscore", "backbone", "text!html/orgs/shared/posts.html", "js/modules/orgs/collections/community", "js/views/alerts", "js/models/types", "text!html/orgs/shared/users.html", "text!html/items/user.html", "text!html/404/users.html"], ($, _, Backbone, template, cCommunity, vAlerts, mTypes, tUsers, tUser, users404) ->
  widget = Backbone.View.extend(
    
    initialize: (options) -> 
      self = @
      @params = {}
      @params.org_id = options.id
      @params.type = options.page.slice(0,-1)
      @params.mode = 'full' 
      $("#mask").show()
    
    render: ->  
      self = @
      @collection = new cCommunity(@params)
      @collection.fetch
        success: ->
          $("#mask").hide()
          self.display()

        error: (collection, response) ->
          $("#mask").hide()
          if response.status is 404
            self.$el.html _.template(users404, {auth: false})
          else
            Backbone.Events.trigger "alert", {type: "error", message: "Users could not be loaded", response: response, location: "modules/orgs/shared/users", action: "read"}

          
    display: ->
      console.log 'hey'
      self = @
      l = @collection.models.length
      compiled = _.template(tUsers, '')
      $(self.el).append compiled
      if l is 0
        $(self.el).append '<h3 style="text-align: center;margin: 0px; padding: 0px">No users were found based on your criteria</h3>'
      _.each @collection.models, (model) ->
        o = model.toJSON()
        self.$el.append _.template(tUser, {user: o.user, stats: o.stats, address: o.address, pic: self.pic, format_date: self.format_date})
      @$el
  )
  widget
