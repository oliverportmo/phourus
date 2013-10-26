define ["jquery", "underscore", "backbone", "text!html/sidebar/single.html", "js/models/types", "js/views/sidebar/widgets/recent", "js/views/sidebar/widgets/create"], ($, _, Backbone, template, mTypes, vRecent, vCreate) ->
   
  view = Backbone.View.extend(
    el: "#sidebar"
    clasName: "single"
    
    initialize: (options) ->
      @render()
        
    render: ->
      types = mTypes.attributes
      compiled = _.template(template, {types: types})
      $(@el).append compiled
      @subviews "#recent", new vRecent()
      @subviews "#create", new vCreate()
      compiled
      
  )
  view