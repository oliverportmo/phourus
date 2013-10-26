define ["jquery", "underscore", "backbone"], ($) ->
  model = Backbone.Model.extend(
    idAttribute: 'id'
    
    initialize: (options) ->
      @options = options

    url: ->
      "/rest/posts/?id=" + @options.id

  )
  model
