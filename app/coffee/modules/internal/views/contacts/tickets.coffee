define ["jquery", "underscore", "backbone", "text!html/internal/contacts/tickets.html"], ($, _, Backbone, template) ->
   
  view = Backbone.View.extend(
    className: "tickets"
    
    initialize: (options) ->
      
    render: ->
      Backbone.Events.trigger "sidebar", {type: 'internal', params: @options}
      data = {}
      compiled = _.template(template, data)
      $(@el).append compiled
      compiled
      
  )
  view