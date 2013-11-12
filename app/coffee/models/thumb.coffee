define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  model = Backbone.Model.extend(
    
    initialize: (options) ->
      @options = options
      
    url: ->
      query = '?' + @serialize(@options)
      "/rest/thumb/" + query 
  )
  model