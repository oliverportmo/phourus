define ["jquery", "underscore", "backbone", "auth", "text!html/login.html", "text!html/logout.html", "text!html/forgot.html", "text!html/password.html", "js/models/session", "js/views/alerts", "js/models/email"], ($, _, Backbone, auth, tLogin, tLogout, tForgot, tPassword, mSession, vAlerts, mEmail) ->

	view = Backbone.View.extend(
	  el: "#login"
	  tagName: "div"
	  
	  initialize: ->   
	    _.bindAll this
	    @bind "login", @session
	    @render()
		
	  events: 
	    "click #auth": "login"
	    "click #logout": "logout"
	    "click #forgot": "forgot"
	    "click #cancel": "cancel"
	    "click #send": "send"
	 
	  
	  # DOM
	  login: ->
	    @model = mSession
	    Backbone.BasicAuth.set $("input#email").val(), $("input#password").val()
	    self = this
	    @model.save {},
	      success: (model, response) ->
	        self.trigger "login", response
		
	      error: (model, response) ->
	        Backbone.Events.trigger {response: response, location: "views/login", action: "login", type: "error"}
	  
	  logout: ->
	    localStorage.removeItem "user"
	    mSession.clear()
	    @render()
	    vAlerts.add "complete", "You have been logged out successfully.", "1", ""
	 
	 	forgot: ->
	    compiled = _.template(tForgot, {})
	    @$el.html compiled
	    compiled
	  
	  cancel: ->
	    @render()
	  
      # Collect
	  form: ->
	    output = {}
	    output.email = $("#email").val()
	    output.password = $("#password").val()
	    output
	    
	  ### Email
	  send: ->
	    message = _.template(tPassword, 
	      password: 123
	      email: $("#email").val()
	    )	 
	    1
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
      
	  # Render
	  render: ->
	    compiled = _.template(tLogin, {})
	    #compiled = _.template(tLogout, mSession.toJSON())  unless mSession.expired()  unless _.isUndefined(mSession.get("token"))
	    @$el.html compiled
	    compiled
	   
	  # Session  
	  session: (response) ->
	    #start session
	    session = JSON.stringify(response)
	    
	    # Check for local storage first
	    
	    # Set localStorage
	    localStorage.setItem "session", session
	    data = localStorage.getItem("session")
	    output = $.parseJSON(data)
	    mSession.set output
	    
	    #update views: me tab, login, register, profile
	    @render()
	)
	view
