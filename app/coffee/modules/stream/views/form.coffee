define ["jquery", "underscore", "backbone", "forms", "text!html/stream/form.html", "js/modules/stream/models/post", "js/models/types", "js/collections/alerts"], ($, _, Backbone, forms, tForm, mSingle, mTypes, cAlerts) ->
  view = Backbone.View.extend(
    className: "form"
    
    initialize: (options) ->
      _.bindAll this
      @model = new mSingle(options)
      @mode = options.mode
      @type = options.type
      @id = options.id

    render: ->
      Backbone.Events.trigger "sidebar", "form"
      if @mode is "edit"
        @edit @type, @id
      else @add @type if @mode is "add"
      
    add: (type) ->
      @model.clear()
      @generate "add", type, ""

    edit: (type, id) ->
      self = this
      @model.fetch
        success: (model, response) ->
          console.log model.get("meta").type
          self.generate "edit", model.get("meta").type, id

        error: (model, response) ->
	        Backbone.Events.trigger {response: response, location: "modules/stream/views/form", action: "edit", type: "error"}
      
    generate: (mode, type, id) ->
      data = {}
      data.mode = mode
      data.type = type
      data.id = id
      data.description = mTypes.description type
      data.action = "Add"
      if data.mode is "edit"
        data.action = "Edit"
        data.title = type
      if data.mode is "add"
        data.title = data.type.slice(0, data.type.length - 1)
        title = "Timeline"  if data.type is "timeline"
      compiled = _.template(tForm,
        data: data
      )
      @$el.html compiled
      @form data.type
      compiled

    form: (type) ->
      return  if _.isUndefined(type)
      
      schema = mTypes.schema(type)
      schema = _.omit schema, "content"
      _.extend @model,
        schema: schema

      form = new Backbone.Form({schema: schema})
      form.render()
      
      container = @$el.find("#fields")
      container.append form.el
      #form.setElement("#fields")
      #console.log 
      #
      #$("#fields").html 'hello'
      #@subviews "#fields": form
  )
  view
