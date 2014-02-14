define ["jquery", "underscore", "backbone", "text!html/internal/more/backlog.html"], ($, _, Backbone, template) ->
   
  view = Backbone.View.extend(
    className: "backlog"
    
    initialize: (options) ->
      
    render: ->
      Backbone.Events.trigger "sidebar", {type: 'internal', params: @options}
      data = {}
      compiled = _.template(template, data)
      $(@el).append compiled
      compiled
      
  )
  view