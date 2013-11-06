define ["jquery", "underscore", "backbone", "text!html/orgs/org.html", "text!html/headings/org.html", "js/modules/orgs/models/org"], ($, _, Backbone, template, tHeading, model) ->
  view = Backbone.View.extend(
    
    initialize: (options) ->      
      @options= options

    events:
      "click .back": "back"
    
    back: ->
      Backbone.Events.trigger "back", {}
      
    render: () ->
      self = @
      @model = new model({id: @options.id})
      Backbone.Events.trigger "sidebar", {type: 'orgs', org_type: @options.type, page: @options.page, id: @options.id}
      @model.fetch 
        success: ->
          self.display()
          
        error: (model, response) ->
          if response.status is 404
            Backbone.Events.trigger "alert", {type: "message", message: "Org could not be found", response: response, location: "modules/orgs/views/org", action: "read"}
          if response.status is 503
	          Backbone.Events.trigger "alert", {type: "error", message: "Org could not be loaded", response: response, location: "modules/orgs/views/org", action: "read"}

    display: ->
      data = @model.toJSON()
      @options.org = data
      compiled = _.template(template, data)
      @$el.html compiled
      heading = _.template(tHeading, {org: data.org, stats: data.stats, pic: @pic})
      $(".heading").html heading
      @page(@options)
      compiled
  )
  view
