define ["jquery", "underscore", "backbone", "text!html/orgs/org.html", "text!html/headings/org.html", "js/modules/orgs/models/org", "text!html/404/org.html"], ($, _, Backbone, template, tHeading, model, org404) ->
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
      params = {org_type: @options.type, page: @options.page, id: @options.id}
      Backbone.Events.trigger "sidebar", {type: 'default', params: params}
      @model.fetch 
        success: ->
          self.display()
          
        error: (model, response) ->
          if response.status is 404
            self.$el.html _.template(org404, {})
            #Backbone.Events.trigger "alert", {type: "message", message: "Org could not be found", response: response, location: "modules/orgs/views/org", action: "read"}
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
      
      $("ul.tabs a").removeClass('selected')
      if @options.page is 'posts' or @options.page is 'users'
        $("div#org_menu").removeClass('show')  
        $("div#widgets").addClass('full')  
        $("ul.tabs a#tabs_"+@options.page).addClass('selected')
      else
        $("div#org_menu").addClass('show')
        $("div#widgets").removeClass('full')  
        $("div#org_menu ul").hide()
        info = ['about', 'social', 'reviews', 'clout', 'contact', 'events']
        if @options.page in info        
          $("ul.tabs a#tabs_info").addClass('selected')
          $("div#org_menu ul.info").show()
        else
          $("ul.tabs a#tabs_extras").addClass('selected')
          $("div#org_menu ul.extras").show()

      compiled
  )
  view
