define ["jquery", "underscore", "backbone", "js/models/session"], ($, _, Backbone, mSession) ->
  collection = Backbone.Collection.extend(
    
    initialize: (options) ->
      @options = options  
    
    url: ->
      user_id = mSession.auth()
      query = ''
      if !_.isUndefined(@options.limit)
        query += '&limit=' + @options.limit
      if !_.isUndefined(@options.page)
        query += '&page=' + @options.page

      url = "/rest/history/?viewer_id=" + user_id + query
      url

    idAttribute: "id"
  )
  collection
