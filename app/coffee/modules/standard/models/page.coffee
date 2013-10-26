define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  model = Backbone.Model.extend(
    initialize: (options) ->
      @id = options.id

    urlRoot: ->
      "/rest/page/" + @id

    defaults:
      title: "Page not found"
      content: "Sorry, but the page you were looking for does not exist."
  )
  model
