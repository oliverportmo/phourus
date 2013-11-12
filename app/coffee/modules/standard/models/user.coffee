define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  
  model = Backbone.Model.extend(
    
    initialize: (options) ->
      @options= options
      
    url: ->
      url = "/rest/user/" + @options.id
      url
      
    idAttribute: "id"

  )
  model
