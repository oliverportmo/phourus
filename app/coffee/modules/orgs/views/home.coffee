define ["jquery", "underscore", "backbone", "marionette", "text!html/orgs/home.html", "text!html/items/org.html", "js/modules/orgs/collections/orgs", "js/views/sidebar",  "text!html/404/orgs.html"], ($, _, Backbone, marionette, template, tOrg, cOrgs, vSidebar, orgs404) ->
  
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
      $("#mask").show()
      Backbone.Events.trigger "sidebar", {type: 'map', params: @options}
      @collection= new cOrgs({type: @options.type})
      @collection.fetch
	        success: ->
	          $("#mask").hide()
	          self.display()
	
	        error: (collection, response) ->
	          $("#mask").hide()
	          self.$el.html _.template(orgs404, {})
	          #Backbone.Events.trigger "alert", {type: "error", message: "Could not load Orgs", response: response, location: "modules/orgs/views/home", action: "read"}
    	
    display: ->
      self = @
      data = {type: @options.type}
      compiled = _.template(template, data)
      $(@el).html compiled
      list = @$el.find '#list'
      _.each @collection.models, (model) ->
        data = model.toJSON()
        item = _.template(tOrg, {org: data.org, stats: data.stats, address: data.address[0], pic: self.pic})
        list.append item
      
      
      Backbone.Events.trigger "map", @collection.models
      compiled
  )
  view	
