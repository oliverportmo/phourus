define ["jquery", "underscore", "backbone", "marionette", "text!html/orgs/home.html", "text!html/orgs/listing.html", "js/modules/orgs/collections/orgs", "js/views/sidebar"], ($, _, Backbone, marionette, template, iList, cOrgs, vSidebar) ->
  
  ###      
  item = Backbone.Marionette.ItemView.extend(
  	template: iList
  )
  view = Backbone.Marionette.CompositeView.extend(
    itemView: item
    itemViewContainer: '#item'
    template: template
    collection: new cGovs(raw)    
  )
  view
  ###
  view = Backbone.View.extend(
    tagName: 'div'
    
    initialize: (options) ->
      self = @
      @options = options
    
    render: ()->
      self = @
      Backbone.Events.trigger "sidebar", 'map' 
      @collection= new cOrgs({type: @options.type})
      @collection.fetch
	        success: ->
	          self.display()
	
	        error: (collection, response) ->
	          Backbone.Events.trigger {response: response, location: "modules/orgs/views/home", action: "read", type: "error"}
    	
    display: ->
      self = @
      data = {type: @options.type}
      compiled = _.template(template, data)
      $(@el).html compiled
      list = @$el.find '#list'
      _.each @collection.models, (model) ->
        data = model.toJSON()
        item = _.template(iList, {org: data.org, stats: data.stats, address: data.address[0], pic: self.pic})
        list.append item
      
      
      Backbone.Events.trigger "map", @collection.models
      compiled
  )
  view	
