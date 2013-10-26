define ["jquery", "underscore", "backbone", "text!html/widgets/maps.html"], ($, _, Backbone, template) ->
  widget = Backbone.View.extend(

    render: ->
      data = {}
      compiled = _.template(template, data)
      $(@el).append compiled
      compiled
      
  )
  widget
