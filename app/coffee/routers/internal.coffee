define ["jquery", "underscore", "backbone", "marionette"], ($, _, Backbone, marionette) ->
  router = Backbone.Marionette.AppRouter.extend(
        
    initialize: (options) ->
      @bind 'route', @track
    
    appRoutes:
      "contacts/:page": "contacts"
      "finance/:page": "finance"
      "more/:page": "more"
      
  )