define ["jquery", "underscore", "backbone"], ($) ->
  model = Backbone.Model.extend(
    idAttribute: 'id'
    
    initialize: (options) ->
      @options = options

    url: ->
      url = "/rest/comment/?id=" + @options.id
      url

    idAttribute: "id"
    
  )
  model
