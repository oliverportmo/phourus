define ["jquery", "underscore", "backbone", "text!html/internal/home.html"], ($, _, Backbone, template) ->
  view = Backbone.View.extend(
    className: "home"
    
    initialize: (options) ->
      @render(options)
 
    render: (options) ->
      data = {}
      compiled = _.template(template, data)
      @$el.html compiled     
      compiled
  )
  view