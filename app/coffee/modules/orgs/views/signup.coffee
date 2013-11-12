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
      @form.commit()
      data = @model.attributes
      delete data.terms
      @model.save @model.attributes,
        success: (model, response) ->
            Backbone.Events.trigger "alert", {type: "complete", message: "Org signup complete", response: response, location: "modules/orgs/views/signup", action: "create"}
        error: (model, response) ->
	          Backbone.Events.trigger "alert", {type: "error", message: "Org could not be created", response: response, location: "modules/orgs/views/signup", action: "create"}

  )
  view
