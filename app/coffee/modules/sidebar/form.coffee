define ["jquery", "underscore", "backbone", "text!html/sidebar/form.html", "js/models/types", "js/modules/sidebar/widgets/recent", "js/modules/sidebar/widgets/create"], ($, _, Backbone, template, mTypes, vRecent, vCreate) ->
   
  view = Backbone.View.extend(
    el: "#sidebar"
    className: "form"
    
    initialize: (options) ->
      @render()

    render: ->
      types = mTypes.attributes
      compiled = _.template(template, {types: types})
      $(@el).append compiled
      $("#posts").val(@options.type)
      @subviews "#recent", new vRecent({collapsible: true})
      @subviews "#create", new vCreate({collapsible: true})
      compiled
      
  )
  view