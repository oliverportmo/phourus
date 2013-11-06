define ["jquery", "underscore", "backbone", "text!html/orgs/shared/clout.html", "js/modules/orgs/collections/clout"], ($, _, Backbone, template, cClout) ->
  widget = Backbone.View.extend(

    initialize: (options) ->
      self = @
      options.id = 1
      @collection = new cClout(options)
      @collection.fetch
        success: ->
          self.render()

        error: (collection, response) ->
	        Backbone.Events.trigger "alert", {type: "error", message: "Clout could not be loaded", response: response, location: "modules/orgs/shared/clout", action: "read"}

    render: ->
      data = @collection.models
      console.log data
      compiled = _.template(template, {data: data})
      $(@el).append compiled
      compiled
      
  )
  widget
