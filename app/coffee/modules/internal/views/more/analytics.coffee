define ["jquery", "underscore", "backbone", "text!html/internal/more/analytics.html"], ($, _, Backbone, template) ->
   
  view = Backbone.View.extend(
    className: "analytics"
    
    initialize: (options) ->
      
    render: ->
      Backbone.Events.trigger "sidebar", {type: 'internal', params: @options}
      data = {}
      compiled = _.template(template, data)
      $(@el).append compiled
      compiled
      
  )
  view