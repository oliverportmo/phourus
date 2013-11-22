define ["jquery", "underscore", "backbone", "forms", "text!html/standard/signup.html", "text!html/email/signup.html", "js/modules/standard/models/user", "js/models/types"], ($, _, Backbone, forms, template, tSignup, mUser, mTypes) ->
  view = Backbone.View.extend(
    
    events:
      "click .register": "register"

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
    
    register: (e) ->
      self = @
      @form.commit()
      if !_.isNull(@form.validate())
        Backbone.Events.trigger "alert", {type: "error", message: "There were errors with the form data you entered, please correct these in order to continue", response: '', location: "modules/standard/views/signup", action: "validate"}
      else
        data = @model.attributes
        delete data.terms
        @model.save data,
          success: (model, response) ->
              self.email data
              Backbone.Events.trigger "alert", {type: "complete", message: "User signup complete", response: response, location: "modules/standard/views/signup", action: "create"}
              $(self.el).html "<h2 style='text-align: center'>Signup is complete. Please check the email you provided for your login information.</h2>"
          error: (model, response) ->
  	          Backbone.Events.trigger "alert", {type: "error", message: "User account could not be created", response: response, location: "modules/standard/views/signup", action: "create"}
  	 

  )
  view
