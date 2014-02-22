define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  model = Backbone.Model.extend(
    urlRoot: ->
      "/rest/address/"
  )
  model