define ["jquery", "underscore", "backbone"], ($) ->
  model = Backbone.Model.extend(
    idAttribute: 'id'
    
    initialize: (options) ->
      @options = options

    methods: 
      'read': 'posts/?id=' 
      'create': 'post/'
      'update': 'post/'
      'delete': 'post/'

    sync: (method, model, options) ->
      options = options || {}
      options.url = 'rest/' + model.methods[method.toLowerCase()];
      options.url += @options.id unless _.isUndefined(@options.id)
      Backbone.sync.apply @, arguments

  )
  model
