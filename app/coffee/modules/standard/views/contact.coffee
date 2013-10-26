define ["jquery", "underscore", "backbone", "text!html/standard/contact.html", "firefly"], ($, _, Backbone, template, firefly) ->
  view = Backbone.View.extend(
    initialize: ->

    render: ->
      data = {}
      Backbone.Events.trigger "sidebar", "general"
      compiled = _.template(template, data)
      @$el.html compiled
      compiled
  )
  view
