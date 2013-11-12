define ["jquery", "underscore", "backbone", "js/models/session", "js/models/settings"], ($, _, Backbone, mSession, mSettings) ->
  collection = Backbone.Collection.extend(
    
    initialize: (options) ->
      @options= options
      
    url: ->
      url = "/rest/review/?org_id=" + @options.id + "&page=" + @options.page + "&limit=" + @options.limit;
      url
      
    idAttribute: "id"
  )
  collection
