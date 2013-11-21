define ["jquery", "underscore", "backbone", "forms", "text!html/standard/contact.html", "js/models/types", "js/modules/standard/models/contact"], ($, _, Backbone, forms, template, mTypes, mContact) ->
  view = Backbone.View.extend(
    
    className: "contact"
  
    events:
      "click .contact": "contact"
      
    initialize: () ->
      
    render: ->
      data = {}
      data.description = mTypes.description "contact"
      Backbone.Events.trigger "sidebar", "general"  
      compiled = _.template(template, {data: data})
      @$el.html compiled
      
      @model = new mContact()
      schema = mTypes.schema('contact')
      _.extend @model, {schema: schema}

      @form = new Backbone.Form({schema: schema, model: @model})
      @form.render()
      
      #$("#fields").append @form.el
      container = @$el.find("#fields")
      container.append @form.el
      @
    
    contact: (e) ->
      self = @
      @form.commit()
      if !_.isNull(@form.validate())
        Backbone.Events.trigger "alert", {type: "error", message: "There were errors with the form data you entered, please correct these in order to continue", response: '', location: "modules/standard/views/contact", action: "validate"}
      else
        data = @model.attributes
        delete data.terms
        @model.save data,
          success: (model, response) ->
              Backbone.Events.trigger "alert", {type: "complete", message: "We have received your inquiry, and will follow up shortly.", response: response, location: "modules/standard/views/contact", action: "create"}
              $(self.el).html "<h2 style='text-align: center'>We have received your inquiry, and will follow up shortly.</h2>"
          error: (model, response) ->
  	          Backbone.Events.trigger "alert", {type: "error", message: "There was an issue sending your request. Please try again.", response: response, location: "modules/standard/views/contact", action: "create"}

  )
  view
