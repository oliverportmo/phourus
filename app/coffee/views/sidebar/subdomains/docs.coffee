define ["jquery", "underscore", "backbone", "text!html/sidebar/subdomains/docs.html"], ($, _, Backbone, template) ->
   
  view = Backbone.View.extend(
    el: "#sidebar"
    className: "docs"
    
    initialize: (options) ->
      @render()
              
    render: ->
      compiled = _.template(template, {})
      $(@el).append compiled
      compiled
      
  )
  view