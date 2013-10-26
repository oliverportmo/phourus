define ["jquery", "underscore", "backbone", "text!html/sidebar/general.html"], ($, _, Backbone, template) ->
   
  view = Backbone.View.extend(
    el: "#sidebar"
    className: "general"
    
    initialize: (options) ->
      @render()
              
    render: ->
      compiled = _.template(template, '')
      $(@el).append compiled
      compiled
      
  )
  view