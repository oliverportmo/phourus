define ["jquery", "underscore", "backbone", "forms", "text!html/orgs/shared/contact.html"], ($, _, Backbone, forms, template, mOrg) ->
  widget = Backbone.View.extend(

    initialize: (options) ->
      self = @
      @options.id = 1
      console.log options
      @render()

    render: ->
      data = @options.org
      compiled = _.template(template, {org: data.org, address: data.address[0], id: data.id})
      $(@el).append compiled
      @form()
      compiled

    form: ->
      @model = new Backbone.Model()
      form = {
	  	  name: "Text"
	  	  email: "Text"
	  	  phone: "Text"
	  	  message: "Text"}
      @model.set("form", form)
      
      return  if @model.get("form") is false
      
      schema = @model.get("form")
      _.extend @model,
        schema: schema
 
      form = new Backbone.Form({schema: schema})
      form.render()
      
      container = @$el.find("#fields")
      container.append form.el
      $('.bbf-form').append '<button class="button green">Submit Form</button>'
      
  )
  widget
