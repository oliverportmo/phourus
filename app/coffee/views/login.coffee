define ["jquery", "underscore", "backbone", "auth", "text!html/login.html", "text!html/logout.html", "text!html/forgot.html", "text!html/password.html", "js/models/login", "js/models/session", "js/models/settings"], ($, _, Backbone, auth, tLogin, tLogout, tForgot, tPassword, mLogin, mSession, mSettings) ->

  view = Backbone.View.extend(
    el: "#login"
    tagName: "div"
	  
    initialize: ->  
      _.bindAll @
      mSession.on "change", @render
      @render()
    
    events: 
      "click #auth": "login"
      "click #logout": "logout"
      "click #forgot": "forgot"
      "click #cancel": "cancel"
      "click #send": "send"
      "click #me": "me"
    
    # Render
    render: () ->
      data= mSession.attributes || {}
      if !_.isEmpty(data) and !mSession.expired()
        compiled = _.template(tLogout, data)
      else
        compiled = _.template(tLogin, data)
	     
      @$el.html compiled
      compiled

    ### LOGIN ###
    login: ->
      self = @
      $("#mask").show()
      Backbone.BasicAuth.set $("input#email").val(), $("input#password").val()
      model = new mLogin()
      model.save {},
        success: (model, response) ->
          if response is false
            Backbone.Events.trigger "alert", {type: "message", message: "Login was unsuccessful, please try again", response: response, location: "views/login", action: "login"}
          else
            self.session response
          $("#mask").hide()
        error: (model, response) ->
          Backbone.Events.trigger "alert", {type: "error", message: "Login was unsuccessful, please try again", response: response, location: "views/login", action: "login"}
          $("#mask").hide()
	  
    session: (response) ->
      #start session
      session = JSON.stringify(response)
      
      # Check for local storage first
      
      # Set localStorage
      localStorage.setItem "session", session
      location.reload(false)
      #data = localStorage.getItem("session")
      #out = $.parseJSON(data)
      #mSession.set out
          
    ### LOGOUT ### 
    logout: ->
      localStorage.removeItem "session"
      #mSession.destroy()
      location.reload(false)
      #mSession.clear()
      #Backbone.Events.trigger "alert", {type: "complete", message: "You have been logged out successfully"}
    
    ### FORGOT ###
    forgot: ->
      compiled = _.template(tForgot, {})
      @$el.html compiled
      compiled
              
    # Cancel
    cancel: ->
      @render()
	  
    # Collect
    form: ->
      output = {}
      output.email = $("#email").val()
      output.password = $("#password").val()
      output
     
    # Me
    me: ->
       mSettings.set("mode", "me")
        
    # Email
    send: ->
      ###
      message = _.template(tPassword, 
        password: 123
        email: $("#email").val()
      )	 

      email = new mEmail(
        recipient_email: $("#email").val()
        subject: "Your Phourus Password"
        message: message
      )
      email.save
        success: ->
      
        error: ->
          vAlerts.add "message", "Password could not be sent.", "1", ""
      ###
  )
  view