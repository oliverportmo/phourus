define ["jquery", "underscore", "backbone", "text!html/stream/notifications.html", "js/collections/notifications"], ($, _, Backbone, template, cNotifications) ->
  vNotifications = Backbone.View.extend(
    className: "notifications"
    
    initialize: ->
      Backbone.Events.trigger "sidebar", 'default'
      
    render: () ->
      self = @
      collection = new cNotifications({page: 0, limit: 40})
      collection.fetch 
        success: (model, response) ->
          self.$el.html _.template(template, {data: response})
        error: (model, response) ->
          if response.status is 404
            self.$el.html 'Notifications were not found'
          else
	          Backbone.Events.trigger "alert", {type: "error", message: "Notifications could not be loaded", response: response, location: "views/notifications", action: "read"}

  )
  vNotifications
