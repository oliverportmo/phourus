define ["jquery", "underscore", "backbone", "storage"], ($, _, Backbone, storage) ->
  mSession = Backbone.Model.extend(
    
    idAttribute: 'id'
    url: ->
      "/rest/session"
      
    initialize: () ->
      Backbone._sync = Backbone.sync
      @.on "change", @update
    
    auth: () ->
      if _.isUndefined(@get("id")) or _.isUndefined(@get("user_id")) or _.isEmpty(@.attributes)
        false
      else
        @get("user_id")
       
    # Local (Called after event listener set on init.coffee)
    local: () ->
      unless _.isNull(localStorage.getItem("session"))
        if @.expired()
          localStorage.removeItem "session"
          @.clear()
        else
          data = $.parseJSON(localStorage.getItem("session"))
          @.set data
      @update()
      
    # Update 
    update: () ->
      self = @
      token = 'guest'
      user_id = 0
      token = @.get("id") unless _.isUndefined(@.get("id"))
      user_id = @.get("user_id") unless _.isUndefined(@.get("user_id"))
      Backbone.Events.trigger "token", {token: token, user_id: user_id}
    
    # Expired   
    expired: ->
      expires = @get("expires")
      now = @now()
      #console.log "Expires: " + expires + "     Now: " + now
      expired = expires < now
      expired
      
    # Now
    now: ->
      date = new Date().toISOString()
      output = date.replace("T", " ")
      output = output.split(".")
      output[0]
      
  )
  new mSession()
