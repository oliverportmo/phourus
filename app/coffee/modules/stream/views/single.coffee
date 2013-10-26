define ["jquery", "underscore", "backbone", "js/modules/stream/models/post", "text!html/stream/single.html", "js/modules/stream/views/heading", "js/models/types"], ($, _, Backbone, model, template, vHeading, mTypes) ->
  view = Backbone.View.extend(
    
    className: "single"
    
    initialize: (options) ->
      @load options.id

    load: (id) ->
      console.log id
      @model = new model({id: id})
      self = this
      @model.fetch 
        success: ->
          self.render()
          
        error: (model, response) ->
	          Backbone.Events.trigger {response: response, location: "modules/stream/views/single", action: "read", type: "error"}

    render: -> 
      data = @model.toJSON()
      unless _.isUndefined(data.meta)
        type = data.meta.type
        element = mTypes.get_parent(type)
        Backbone.Events.trigger "sidebar", "single"
        compiled = _.template(template, {data: data, meta: data.meta, post: data.post, user: data.user, element: element})
        @$el.html compiled
        @subviews "#heading": new vHeading(model: @model)   
        compiled
  )
  view
