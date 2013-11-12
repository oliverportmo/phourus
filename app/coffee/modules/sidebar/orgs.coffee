define ["jquery", "underscore", "backbone", "text!html/sidebar/orgs.html", "js/collections/widgets"], ($, _, Backbone, template, cWidgets) ->
   
  view = Backbone.View.extend(
    el: "#sidebar"
    className: "orgs"
    
    initialize: (options) ->
      @options= options
      @render()
    
    events:
      "click a": "select"
      "click button#zipcode": "zip"
    
    select: (e) ->
      Backbone.Events.trigger "location", e.currentTarget.id
    
    zip: (e) ->
      Backbone.Events.trigger "location", $("input#zip").val()
        
    render: ->
      data = {}        
      data.id = @options.id
      data.module = @options.type
      data.views = cWidgets[@options.org_type]
      data.type = @options.org_type
      compiled = _.template template, {data: data} 
      @$el.html compiled 
      @options.type = ''
      compiled   
  )
  view