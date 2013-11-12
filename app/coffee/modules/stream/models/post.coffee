define ["jquery", "underscore", "backbone"], ($) ->
  model = Backbone.Model.extend(
    idAttribute: 'id'
    
    initialize: (options) ->
      @options = options

    url: ->    
      if _.isUndefined(@options.id)
        query = ''
      else
        query = @options.id
          
      url = "/rest/post/" + query
      url
  )
  model
