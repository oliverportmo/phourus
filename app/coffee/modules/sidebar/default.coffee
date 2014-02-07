define ["jquery", "underscore", "backbone", "text!html/sidebar/default.html", "js/models/settings"], ($, _, Backbone, template, mSettings) ->
   
  view = Backbone.View.extend(
    el: "#sidebar"
    className: "default"
    
    initialize: (options) ->
      @render()
    
    events: 
      "click .me": "me"
    
    me: () ->
      console.log mSettings
      mSettings.set("mode", "me")
                
    render: ->
      data = {user_id: 1}
      compiled = _.template(template, data)
      $(@el).append compiled
      compiled
      
  )
  view