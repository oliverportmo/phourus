define ["jquery", "underscore", "backbone", "text!html/widgets/facebook.html"], ($, _, Backbone, template) ->
  widget = Backbone.View.extend(

    events:
      "click a#temp": "test"
      
    test: ->
      alert 'test'
            
    render: ->
      data = {}
      compiled = _.template(template, data)
      $(@el).append compiled
      compiled
  )
  widget
