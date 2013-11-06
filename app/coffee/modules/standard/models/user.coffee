define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  
  model = Backbone.Model.extend(
    
    initialize: (options) ->
      @options= options
      
    url: ->
      url = "/rest/users/?id=" + @options.id;
      url
      
    idAttribute: "id"

  )
  model
