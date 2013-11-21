define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  
  model = Backbone.Model.extend(
    
    initialize: (options) ->
      @options= options
      
    url: ->
      query = ''
      if !_.isUndefined(@options) and !_.isUndefined(@options)
        query = @options.id
      url = "/rest/user/" + query
      url
      
    idAttribute: "id"
      
  )
  model
