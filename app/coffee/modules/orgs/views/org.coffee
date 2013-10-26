define ["jquery", "underscore", "backbone", "text!html/orgs/org.html", "js/modules/orgs/views/heading", "js/views/sidebar", "js/modules/orgs/models/org"], ($, _, Backbone, template, vHeading, vSidebar, model) ->
  view = Backbone.View.extend(
    
    initialize: (options) ->      
      @options= options

    render: () ->
      @model = new model({id: @options.id})
      Backbone.Events.trigger "sidebar", {type: 'orgs', org_type: @options.type, page: @options.page, id: @options.id}
      self = this
      @model.fetch 
        success: ->
          self.display()
          
        error: (model, response) ->
	          Backbone.Events.trigger {response: response, location: "modules/orgs/views/org", action: "read", type: "error"}

    display: ->
      data = @model.toJSON()
      @options.org = data
      compiled = _.template(template, data)
      @$el.html compiled
      @subviews "#heading", new vHeading(data)
      @page(@options)
      compiled
  )
  view
