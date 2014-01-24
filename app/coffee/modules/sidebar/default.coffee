define ["jquery", "underscore", "backbone", "text!html/sidebar/default.html"], ($, _, Backbone, template) ->
   
  view = Backbone.View.extend(
    el: "#sidebar"
    className: "default"
    
    initialize: (options) ->
      @render()
              
    render: ->
      data = {user_id: 1}
      compiled = _.template(template, data)
      $(@el).append compiled
      compiled
      
  )
  view