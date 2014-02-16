define ["jquery", "underscore", "backbone", "text!html/stream/history.html", "js/collections/history", "text!html/items/post.html", "text!html/items/user.html", "text!html/items/org.html", "js/models/types", "js/models/session"], ($, _, Backbone, template, cHistory, tPost, tUser, tOrg, mTypes, mSession) ->
  vHistory = Backbone.View.extend(
    className: "history"
    
    initialize: () ->
      Backbone.Events.trigger "sidebar", "default"
    
    render: () ->
      self = @
      data = {}  
      compiled = _.template(template, data)
      @$el.html compiled
      
      h = new cHistory({page: 0, limit: 20})
      h.fetch 
        success: (collection, response) ->
          self.display(response)
        error: (collection, response) ->
          if response.status is 404
            self.$el.html 'History was not found'
          else
	          Backbone.Events.trigger "alert", {type: "error", message: "History could not be loaded", response: response, location: "views/history", action: "read"}


    display: (collection) ->
      self = @
      $history = $("div#history")  
      _.each collection, (obj, key) ->
        
        # post
        if !_.isUndefined(obj.post)
          type = obj.meta.type
          element = mTypes.get_parent(type)
          owner = obj.meta.user_id is mSession.get("user_id")
          compiled = _.template(tPost, {address: obj.user.address[0], meta: obj.meta, post: obj.post, stats: obj.stats, user: obj.user.user, element: element, owner: owner, pic: self.pic, format_date: self.format_date})
        
        # user
        if !_.isUndefined(obj.user) and !_.isUndefined(obj.address)
          compiled = _.template(tUser, {user: obj.user, stats: obj.stats, address: obj.address, pic: self.pic, format_date: self.format_date})
        
        # org
        if !_.isUndefined(obj.org)
          compiled = _.template(tOrg, {org: obj.org, stats: obj.stats, address: obj.address[0], pic: self.pic})
        
        # append
        if !_.isUndefined(compiled)  
          $history.append compiled

  )
  vHistory
