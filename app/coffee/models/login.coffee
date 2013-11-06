define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  model = Backbone.Model.extend(
    
    idAttribute: 'id'
    url: ->
      "/rest/session"
          
  )
  model
