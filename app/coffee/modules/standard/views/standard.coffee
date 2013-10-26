define ["jquery", "underscore", "backbone", "text!html/standard/standard.html"], ($, _, Backbone, template) ->
  view = Backbone.View.extend(
    initialize: ->
      @render()

    render: ->
      data = {}
      Backbone.Events.trigger "sidebar", "general"
      compiled = _.template(template, data)
      @$el.html compiled
      compiled
  )
  view
