define ["jquery", "underscore", "backbone", "js/models/user", "text!html/user.html"], ($, _, Backbone, model, template) ->
  vUser = Backbone.View.extend(
    el: "#user"
    tagName: "div"
    initialize: ->
      
    load: (id) ->
      self = this
      @model = new model(id: id)
      @model.fetch 
        success: ->
          self.render()
        
        error: (model, response) ->
	          Backbone.Events.trigger {response: response, location: "views/user", action: "read", type: "error"}

    render: ->
      Backbone.Events.trigger "sidebar", "profile"
      data = @model.toJSON()
      compiled = _.template(template,
        data: data
      )
      @$el.html compiled 
      compiled
  )
  vUser