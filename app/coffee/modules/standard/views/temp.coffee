define ["jquery", "underscore", "backbone", "text!html/standard/temp.html"], ($, _, Backbone, template) ->
  vTemp = Backbone.View.extend(
    initialize: ->

    render: ->
      data = {}
      Backbone.Events.trigger "sidebar", "general"
      compiled = _.template(template, data)
      @$el.html compiled
      compiled
  )
  vTemp
