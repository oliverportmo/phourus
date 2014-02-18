define ["jquery", "underscore", "backbone", "text!html/orgs/extras.html"], ($, _, Backbone, template) ->
  view = Backbone.View.extend(
    
    initialize: ->
      @render()
      
    render: ->
      data = {}
      Backbone.Events.trigger "sidebar", "default"
      compiled = _.template(template, data)
      @$el.html compiled
      compiled
  )
  view
