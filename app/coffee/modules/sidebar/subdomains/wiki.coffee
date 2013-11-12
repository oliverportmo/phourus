define ["jquery", "underscore", "backbone", "text!html/sidebar/subdomains/wiki.html"], ($, _, Backbone, template) ->
   
  view = Backbone.View.extend(
    el: "#sidebar"
    className: "wiki"
    
    initialize: (options) ->
      @render()
              
    render: ->
      compiled = _.template(template, {})
      $(@el).append compiled
      compiled
      
  )
  view