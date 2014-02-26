define ["jquery", "underscore", "backbone", "marionette"], ($, _, Backbone, marionette) ->
  router = Backbone.Marionette.AppRouter.extend(
    
    initialize: (options) ->
      @bind 'route', @track
    
    appRoutes:
      "pages": "pages"
      #"page/add/": "add"
      #"page/edit/:id": "edit"
      "*page": "page"
      
  )