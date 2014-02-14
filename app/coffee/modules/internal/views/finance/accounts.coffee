define ["jquery", "underscore", "backbone", "text!html/internal/finance/accounts.html"], ($, _, Backbone, template) ->
   
  view = Backbone.View.extend(
    className: "accounts"
    
    initialize: (options) ->
      
    render: ->
      Backbone.Events.trigger "sidebar", {type: 'internal', params: @options}
      data = {}
      compiled = _.template(template, data)
      $(@el).append compiled
      compiled
      
  )
  view