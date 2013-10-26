define ["jquery", "underscore", "backbone", "text!html/govs/widgets/financial.html"], ($, _, Backbone, template) ->
  widget = Backbone.View.extend(

    initialize: (options) ->
      @render()
      
    render: ->
      data = {}
      compiled = _.template(template, data)
      $(@el).append compiled
      compiled
      
  )
  widget
