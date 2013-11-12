define ["jquery", "underscore", "backbone", "text!html/sidebar/profile.html"], ($, _, Backbone, template) ->
   
  view = Backbone.View.extend(
    el: "#sidebar"
    className: "profile"
    
    initialize: (options) ->
      @render()
              
    render: ->
      compiled = _.template(template, '')
      $(@el).append compiled
      compiled
      
  )
  view