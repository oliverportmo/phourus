define ["jquery", "underscore", "backbone", "text!html/sidebar/subdomains/internal.html"], ($, _, Backbone, template) ->
   
  view = Backbone.View.extend(
    el: "#sidebar"
    className: "internal"
    
    initialize: (options) ->
      @render()
              
    render: ->
      compiled = _.template(template, {})
      $(@el).append compiled
      compiled
      
  )
  view