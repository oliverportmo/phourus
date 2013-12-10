define ["jquery", "underscore", "backbone", "text!html/orgs/shared/clout.html", "js/modules/orgs/collections/clout", "text!html/404/clout.html"], ($, _, Backbone, template, cClout, clout404) ->
  widget = Backbone.View.extend(

    initialize: (options) ->
      self = @
      params = {}
      params.org_id = options.id
      @collection = new cClout(params)
      $("#mask").show()
      @collection.fetch
        success: ->
          $("#mask").hide()
          self.render()

        error: (collection, response) ->
	        $("#mask").hide()
	        if response.status is 404
	         $(self.el).append _.template(clout404, {})
	        else
	         Backbone.Events.trigger "alert", {type: "error", message: "Clout could not be loaded", response: response, location: "modules/orgs/shared/clout", action: "read"}

    render: ->
      data = @collection.models
      console.log data
      compiled = _.template(template, {data: data})
      $(@el).append compiled
      compiled
      
  )
  widget
