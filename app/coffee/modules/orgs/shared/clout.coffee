define ["jquery", "underscore", "backbone", "text!html/orgs/shared/clout.html", "js/modules/orgs/collections/clout"], ($, _, Backbone, template, cClout) ->
  widget = Backbone.View.extend(

    initialize: (options) ->
      self = @
      params = {}
      params.org_id = options.id
      @collection = new cClout(params)
      @collection.fetch
        success: ->
          self.render()

        error: (collection, response) ->
	        if response.status is 404
	         $(self.el).append '<h2 style="text-align:center">This Organization has not added any Clout</h2>'
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
