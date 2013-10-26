define ["jquery", "underscore", "backbone", "text!html/sidebar/widgets/create.html", "js/models/types"], ($, _, Backbone, template, mTypes) ->
   
  view = Backbone.View.extend(
    tagName: "div"
    
    initialize: (options) ->
      @options = {} 
      @options.collapsible = true
      @types = mTypes.attributes
      @render()
    
    events: 
      "click .button#add": "select"
    
    select: (e) ->
      type = $("select#types").val()
      window.location.hash = "#add/" + type
            
    render: ->
      compiled = _.template(template, {types: @types, collapsible: @options.collapsible})
      $(@el).append compiled 
      compiled
      
  )
  view