define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  collection = Backbone.Collection.extend(
    
    initialize: (options)->
      @options = options
      console.log options
      
    url: ->
      url = "/rest/orgs/?" + @query()
      url
    
    query: ->
      query = ''
      if !_.isUndefined(@options.user_id)
        query = "user_id=" + @options.user_id + "&"
      else if !_.isUndefined(@options.id)
        query = "id=" + @options.id

      query += "type=" + @options.type + "&" unless _.isUndefined(@options.type)
      query += "state=" + @options.state + "&" unless _.isUndefined(@options.state)
      query += "zip=" + @options.state + "&" unless _.isUndefined(@options.zip) 
      query
        
    idAttribute: "id"
  )
  collection