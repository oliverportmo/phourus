define ["jquery", "underscore", "backbone", "js/models/session", "js/models/settings"], ($, _, Backbone, mSession, mSettings) ->
  collection = Backbone.Collection.extend(
    
    initialize: (options) ->
      @options= options
            
    idAttribute: "id"
    
    initialize: (options) ->
      @options = options
      
    url: ->
      query = '?' + @serialize(@options)
      "/rest/clout/" + query 
  )
  collection
