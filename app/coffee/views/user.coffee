define ["jquery", "underscore", "backbone", "js/models/user", "text!html/user.html", "text!html/404/user.html"], ($, _, Backbone, model, template, user404) ->
  vUser = Backbone.View.extend(
    el: "#user"
    tagName: "div"
    initialize: ->
      
    load: (id) ->
      self = this
      $("#mask").show()
      @model = new model(id: id)
      @model.fetch 
        success: ->
          self.render()
          $("#mask").hide()
        error: (model, response) ->
          $("#mask").hide()
          if response.status is 404
            self.$el.html _.template(user404, {})
          else
	          Backbone.Events.trigger "alert", {type: "error", message: "User could not be loaded", response: response, location: "views/user", action: "read"}
	          

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