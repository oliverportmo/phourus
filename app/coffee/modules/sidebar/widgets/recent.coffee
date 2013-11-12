define ["jquery", "underscore", "backbone", "js/views/alerts", "text!html/sidebar/widgets/recent.html", "js/collections/recent"], ($, _, Backbone, vAlerts, template, collection) ->
   
  view = Backbone.View.extend(
    tagName: "div"
    
    initialize: (options) ->
      self = @
      @initialized = 0
      @options = {}
      @options.collapsible = true
      @collection = new collection({id: '1'})
      ###
      @collection.fetch
	        success: ->
	          self.initialized = 1
	          self.render()
	
	        error: (collection, response) ->
	          console.log response
	          vAlerts.add response, "vStream", "filter", "error"
	   ###
            
    render: ->
      # hack?
      if @initialized is 1
        data = @collection.models
        compiled = _.template(template, {data: data, collapsible: @options.collapsible})
        $(@el).append compiled 
        compiled
  )
  view