define ["jquery", "underscore", "backbone", "forms", "text!html/standard/contact.html", "js/models/types", "js/modules/standard/models/contact"], ($, _, Backbone, forms, template, mTypes, mContact) ->
  view = Backbone.View.extend(
    
    className: "contact"
  
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
  )
  view
