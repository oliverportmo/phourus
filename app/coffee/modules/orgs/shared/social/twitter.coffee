define ["jquery", "underscore", "backbone", "text!html/widgets/twitter.html"], ($, _, Backbone, template) ->
  widget = Backbone.View.extend(
      
    events: 
      "click a#test": "temp"
      
    temp: ->
      alert 'lkhgohigo'
         
    render: ->
      data = {}
      compiled = _.template(template, data)
      $(@el).append compiled
      compiled
  )
  widget
