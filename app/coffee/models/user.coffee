define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  mUser = Backbone.Model.extend(urlRoot: ->
    "/rest/user/"
  )
  mUser