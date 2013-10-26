define ["jquery", "underscore", "backbone"], ($, a, b) ->
  mLogin = Backbone.Model.extend(
    url: ->
      url = "/rest/login?email=" + @get("email") + "&password=" + @get("password")
      url

    
    ###
    APPLY AS GLOBAL OVERRIDE FOR BACKBONE MODEL *
    ###
    parse: (response) ->
      vAlerts.add "error", response.data, 1, response.debug  if response.error is 1
      response.data
  )
  mLogin
