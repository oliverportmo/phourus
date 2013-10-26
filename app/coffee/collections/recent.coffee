define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  collection = Backbone.Collection.extend(
    initialize: (options)->
      @options = options
    
    url: ->
      url = "/rest/recent/?user_id=" + @options.id
      url
      
    idAttribute: "id"
  )
  collection