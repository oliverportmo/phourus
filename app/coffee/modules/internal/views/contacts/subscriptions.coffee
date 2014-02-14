define ["jquery", "underscore", "backbone", "text!html/internal/contacts/subscriptions.html"], ($, _, Backbone, template) ->
   
  view = Backbone.View.extend(
    className: "subscriptions"
    
    initialize: (options) ->
      
    render: ->
      Backbone.Events.trigger "sidebar", {type: 'internal', params: @options}
      data = {}
      compiled = _.template(template, data)
      $(@el).append compiled
      compiled
      
  )
  view