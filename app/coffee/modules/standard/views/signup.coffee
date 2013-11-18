define ["jquery", "underscore", "backbone", "forms", "text!html/standard/signup.html", "text!html/email/signup.html", "js/modules/standard/models/user", "js/models/email", "js/models/types"], ($, _, Backbone, forms, template, tSignup, mUser, mEmail, mTypes) ->
  view = Backbone.View.extend(
    
    events:
      "click #complete": "register"

    render: ->
      data = {}
      Backbone.Events.trigger "sidebar", "general"
      compiled = _.template(template, data)
      @$el.html compiled
      
      @model = new mUser()
      schema = mTypes.schema('signup')
      _.extend @model, {schema: schema}

      @form = new Backbone.Form({schema: schema, model: @model})
      @form.render()
      
      #$("#fields").append @form.el
      container = @$el.find("#fields")
      container.append @form.el
      
      @
    
    register: ->
      @model = new mRegister(@collect())
      self = this
      @model.save {},
        success: (model, response) ->
          message = "Registration was successful. Check your email for your password and account information."
          message += "<br /><strong>Password:</strong> " + response.password
          vAlerts.add "complete", message, "1", ""
          data = self.collect()
          message = _.template(tSignup, data)
          email = new mEmail(
            recipient_name: data.first + " " + data.last
            recipient_email: data.email
            subject: "Your Phourus Password"
            message: message
          )
          email.save
            success: ->

            error: (error, response) ->
              Backbone.Events.trigger "alert", {type: "message", message: "Registration was successful, but there was an error sending your email. Please contact us if you do not receive your password.", response: response, location: "modules/standard/views/signup", action: "save"}


        
        #DEMO PASSWORD
        error: (model, response) ->
          console.log model
          console.log response


    collect: ->
      me = this
      output =
        first: $("#first").val()
        last: $("#last").val()
        email: $("#email").val()
        password: $("#password").val()

      output
  )
  view