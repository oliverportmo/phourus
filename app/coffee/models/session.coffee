define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  mSession = Backbone.Model.extend(
    urlRoot: "/rest/session"
    expired: ->
      expires = @get("expires")
      now = @now()
      console.log "Expires: " + expires + "     Now: " + now
      expired = expires < now
      expired

    now: ->
      date = new Date().toISOString()
      output = date.replace("T", " ")
      output = output.split(".")
      output[0]
  )
  new mSession()
