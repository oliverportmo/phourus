define ["jquery", "underscore", "backbone", "text!html/standard/help.html"], ($, _, Backbone, template) ->
  view = Backbone.View.extend(
    initialize: ->
      @render()

    render: ->
      data = {}
      compiled = _.template(template, data)
      @$el.html compiled
      compiled
  )
  view
