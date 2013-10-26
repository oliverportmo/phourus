define ["jquery", "underscore", "backbone", "text!html/orgs/admin.html"], ($, _, Backbone, template) ->
  view = Backbone.View.extend(
    initialize: ->

    render: ->
      data = {}
      Backbone.Events.trigger "sidebar", "admin"
      compiled = _.template(template, data)
      @$el.html compiled
      compiled
  )
  view