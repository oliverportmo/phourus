define ["jquery", "underscore", "backbone", "js/models/session", "js/models/settings"], ($, _, Backbone, mSession, mSettings) ->
  collection = Backbone.Collection.extend(
    
    initialize: (options) ->
      @options= options
      
    url: ->
      url = "/rest/clout/" + @options.id;
      url
      
    idAttribute: "id"
  )
  collection
