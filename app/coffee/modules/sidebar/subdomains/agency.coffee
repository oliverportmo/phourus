define ["jquery", "underscore", "backbone", "text!html/sidebar/subdomains/agency.html"], ($, _, Backbone, template) ->
   
  view = Backbone.View.extend(
    el: "#sidebar"
    className: "agency"
    
    initialize: (options) ->
      @render()
              
    render: ->
      compiled = _.template(template, {})
      $(@el).append compiled
      compiled
      
  )
  view