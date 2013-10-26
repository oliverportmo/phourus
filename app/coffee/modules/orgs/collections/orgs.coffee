define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  collection = Backbone.Collection.extend(
    initialize: (params)->
      @params = "?type=" + params.type
      @params += "&state=" + params.state unless _.isUndefined(params.state)
      @params += "&zip=" + params.state unless _.isUndefined(params.zip) 
    
    url: ->
      url = "/rest/orgs/" + @params
      url
      
    idAttribute: "id"
  )
  collection