define ["jquery", "underscore", "backbone", "js/models/session", "js/models/settings"], ($, _, Backbone, mSession, mSettings) ->
  mTotal = Backbone.Model.extend(
    url: ->
      url = "/rest/post/" + @query()
      url

    query: ->
      string = ""
      keys = _.keys(mSettings.attributes)
      _.each keys, (key) ->
        string += key + "=" + mSettings.attributes[key] + "&"

      string += "&count=true"
      string += "&token=" + mSession.get("token") + ","  unless _.isUndefined(mSession.get("token"))
      string = "?" + string.substring(0, string.length - 1)
      string

    idAttribute: "id"
  )
  mTotal
