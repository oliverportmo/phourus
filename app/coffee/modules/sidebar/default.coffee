define ["jquery", "underscore", "backbone", "text!html/sidebar/user.html", "text!html/sidebar/guest.html", "js/models/settings", "js/models/session", "js/modules/standard/models/user", "js/collections/history", "js/collections/notifications", "js/views/login"], ($, _, Backbone, tUser, tGuest, mSettings, mSession, mUser, cHistory, cNotifications, vLogin) ->
   
  view = Backbone.View.extend(
    el: "#sidebar"
    className: "default"
    
    initialize: (options) ->
      @render()
    
    events: 
      "click .me": "me"
      "click .logout": "logout"
    
    me: () ->
      console.log mSettings
      mSettings.set("mode", "me")
    
    logout: ->
      localStorage.removeItem "session"
      #mSession.destroy()
      location.href = '/'
      location.reload(false)
      #mSession.clear()
      #Backbone.Events.trigger "alert", {type: "complete", message: "You have been logged out successfully"}

    render: ->
      if mSession.auth() is false
        compiled = _.template(tGuest, {})
        $(@el).html compiled
        
        options = {}
        options.el = "#auth-sidebar"
        @login = new vLogin(options)
        
      else
        self = @
        u = new mUser(id: mSession.auth())
        u.fetch 
          success: (model, response) ->
            self.user(response)
          error: (model, response) ->
            if response.status is 404
              #self.$el.html _.template(user404, {})
            else
  	          Backbone.Events.trigger "alert", {type: "error", message: "Sidebar user could not be loaded", response: response, location: "sidebar/default", action: "read"}
    
    user: (model) ->
      data = {user: model.user, stats: model.stats, address: model.address[0]}
      compiled = _.template(tUser, data)
      $(@el).append compiled
      @history()
      @notifications()
      compiled
    
    history: () ->
      $history = $("ul#history")
      h = new cHistory({page: 0, limit: 4})
      h.fetch 
        success: (model, response) ->
          _.each response, (obj, key) ->
            name = ''
            url = ''
            
            # post
            if !_.isUndefined(obj.post)
              name = obj.post.title
              url = '#!post/' + obj.post.post_id
            
            # user
            if !_.isUndefined(obj.user) and !_.isUndefined(obj.address)
              name = obj.user.first + ' ' + obj.user.last
              url = '#user/' + obj.user.id
            
            # org
            if !_.isUndefined(obj.org)
              name = obj.org.name  
              url = '#!' + obj.org.type + '/' + obj.org.id
            
            $history.append '<li><a href="' + url + '">' + name + '</a></li>'
        error: (model, response) ->
          if response.status is 404
            $history.append '<li>History was not found</li>'
          else
	          Backbone.Events.trigger "alert", {type: "error", message: "Sidebar history could not be loaded", response: response, location: "sidebar/default", action: "read"}


    notifications: () ->
      $notifications = $("ul#notifications")
      n = new cNotifications({page: 0, limit: 4})
      n.fetch 
        success: (model, response) ->
          _.each response, (obj, key) ->
            $notifications.append '<li><a href="">New ' + obj.type + '</a></li>'
        error: (model, response) ->
          if response.status is 404
            $notifications.append '<li>Notifications were not found</li>'
          else
	          Backbone.Events.trigger "alert", {type: "error", message: "Sidebar notifications could not be loaded", response: response, location: "sidebar/default", action: "read"}

  )
  view