define ["jquery", "underscore", "backbone", "text!html/sidebar/pages.html"], ($, _, Backbone, template) ->
   
  view = Backbone.View.extend(
    el: "#sidebar"
    className: "pages"
    
    initialize: (options) ->
      @render()
              
    render: ->
      compiled = _.template(template, {})
      $(@el).append compiled
      compiled
      
  )
  view