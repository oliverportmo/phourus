define ["jquery", "underscore", "backbone", "js/views/alerts"], ($, _, Backbone, vAlerts) ->
  mRegister = Backbone.Model.extend(
    urlRoot: "/rest/register"
    defaults: {}
    parse: (response) ->
      if response.error is 1
        vAlerts.add "error", response.data, 1, response.debug
        return false
      response.data
  )
  mRegister
