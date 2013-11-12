define ["jquery", "underscore", "backbone", "js/models/session", "js/models/settings"], ($, _, Backbone, mSession, mSettings) ->
  cPosts = Backbone.Collection.extend(
    
    initialize: (options) ->
      @options = options
    
    url: ->
      url = "/rest/post/?debug=false&sort=influence&direction=DESC&org_id=" + @options.id + "&page=0&limit=10&types=" + @options.types
      url

    idAttribute: "id"
  )
  cPosts
