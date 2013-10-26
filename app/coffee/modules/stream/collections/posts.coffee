define ["jquery", "underscore", "backbone", "js/models/session", "js/models/settings"], ($, _, Backbone, mSession, mSettings) ->
  cStream = Backbone.Collection.extend(
    url: ->
      url = "/rest/posts/" + @query()
      url

    query: ->
      string = ""
      keys = _.keys(mSettings.attributes)
      _.each keys, (key) ->
        string += key + "=" + mSettings.attributes[key] + "&"

      string += "&token=" + mSession.get("token") + ","  unless _.isUndefined(mSession.get("token"))
      string = "?" + string.substring(0, string.length - 1)
      string

    idAttribute: "id"
  )
  cStream
