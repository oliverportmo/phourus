define ["jquery", "underscore", "backbone", "text!html/sidebar/admin.html"], ($, _, Backbone, template) ->
   
  view = Backbone.View.extend(
    el: "#sidebar"
    className: "admin"
    
    initialize: (options) ->
      @render()
              
    render: ->
      compiled = _.template(template, '')
      $(@el).append compiled
      compiled
      
  )
  view