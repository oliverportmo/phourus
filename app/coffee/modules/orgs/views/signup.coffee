define ["jquery", "underscore", "backbone", "forms", "text!html/orgs/signup.html", "js/modules/orgs/models/org", "js/models/types"], ($, _, Backbone, forms, template, mOrg, mTypes) ->
  view = Backbone.View.extend(
    
    events: 
      "click .back": "back"
      "click .signup": "signup"
      
    render: ->
      data = {}
      Backbone.Events.trigger "sidebar", "general"
      compiled = _.template(template, data)
      @$el.html compiled
      
      @model = new mOrg()
      schema = mTypes.schema('signuporg')
      _.extend @model, {schema: schema}

      @form = new Backbone.Form({schema: schema, model: @model})
      @form.render()
      
      #$("#fields").append @form.el
      container = @$el.find("#fields")
      container.append @form.el
      
      @
    
    # Back
    back: ->
      Backbone.Events.trigger "back", {}
        
    # Signup
    signup: (e) ->
      @create()
      
    # Create 
    create: () ->
      self = @
      @form.commit()
      if !_.isNull(@form.validate())
        Backbone.Events.trigger "alert", {type: "error", message: "There were errors with the form data you entered, please correct these in order to continue", response: '', location: "modules/orgs/views/signup", action: "validate"}
      else
        data = @model.attributes
        delete data.terms
        @model.save data,
          success: (model, response) ->
              Backbone.Events.trigger "alert", {type: "complete", message: "Org signup complete", response: response, location: "modules/orgs/views/signup", action: "create"}
              $(self.el).html "<h2 style='text-align: center'>Signup is complete. Please check the email you provided for your login information.</h2>"
          error: (model, response) ->
  	          Backbone.Events.trigger "alert", {type: "error", message: "Org could not be created", response: response, location: "modules/orgs/views/signup", action: "create"}

  )
  view
