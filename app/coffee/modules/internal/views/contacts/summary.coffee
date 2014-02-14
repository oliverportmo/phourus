define ["jquery", "underscore", "backbone", "text!html/internal/contacts/summary.html"], ($, _, Backbone, template) ->
   
  view = Backbone.View.extend(
    className: "summary"
    
    initialize: (options) ->
      
    render: ->
      Backbone.Events.trigger "sidebar", {type: 'internal', params: @options}
      data = {}
      compiled = _.template(template, data)
      $(@el).append compiled
      compiled
      
  )
  view