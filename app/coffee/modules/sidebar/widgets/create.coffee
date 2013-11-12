define ["jquery", "underscore", "backbone", "text!html/sidebar/widgets/create.html", "js/models/types", "js/models/settings"], ($, _, Backbone, template, mTypes, mSettings) ->
   
  view = Backbone.View.extend(
    tagName: "div"
    
    initialize: (options) ->
      @options = {} 
      @options.collapsible = true
      @types = mTypes.attributes
      @render()
    
    events: 
      "click .button#add": "add"
      "click .button#edit": "edit"
    
    add: (e) ->
      type = $("select#types").val()    
      unless _.isUndefined(type)
        location = "#add/" + type
        window.location.hash = location
      
    edit: ->
       mSettings.set("mode", "me")
               
    render: ->
      compiled = _.template(template, {types: @types, collapsible: @options.collapsible})
      $(@el).append compiled 
      compiled
      
  )
  view