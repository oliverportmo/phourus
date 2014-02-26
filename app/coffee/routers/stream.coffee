define ["jquery", "underscore", "backbone", "marionette"], ($, _, Backbone, marionette) ->
  router = Backbone.Marionette.AppRouter.extend(
    
    initialize: (options) ->
      @bind 'route', @track
    
    appRoutes:
      "!stream": "stream"
      "!post/:id": "post"
      "add/:type": "add"
      "edit/:id": "edit"
      
  )