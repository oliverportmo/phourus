define ["jquery", "underscore", "backbone", "forms", "js/modules/standard/models/user", "js/models/types", "js/models/headers"], ($, _, Backbone, forms, mUser, mTypes, mHeaders) ->
  view = Backbone.View.extend(
    
    render: ->      
      @model = new mUser()
      
      if @options.type is 'short'
        schema = mTypes.schema('short-signup')
      else  
        schema = mTypes.schema('signup')
      
      _.extend @model, {schema: schema}

      @form = new Backbone.Form({schema: schema, model: @model})
      @form.render()
      @form.el      
    
    register: (e) ->
      self = @
      @form.commit()
      if !_.isNull(@form.validate())
        Backbone.Events.trigger "alert", {type: "error", message: "There were errors with the form data you entered, please correct these in order to continue", response: '', location: "modules/standard/views/signup", action: "validate"}
      else
        data = {}
        email = @form.getValue('email')
        password = @form.getValue('password')
        encoded = btoa(email + ":" + password)
        m = new mUser()
        mHeaders.set("Authentication", "Basic " + encoded)
        m.save data,
          success: (model, response) ->
              #self.email data
              Backbone.Events.trigger "alert", {type: "complete", message: "User signup complete", response: response, location: "modules/standard/views/signup", action: "create"}
              $(self.el).html "<h2 style='text-align: center'>Signup is complete. Please check the email you provided for your login information.</h2>"
          error: (model, response) ->
  	          Backbone.Events.trigger "alert", {type: "error", message: "User account could not be created", response: response, location: "modules/standard/views/signup", action: "create"}
  	 

  )
  view
