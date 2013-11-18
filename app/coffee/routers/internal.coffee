define ["jquery", "underscore", "backbone", "marionette"], ($, _, Backbone, marionette, init) ->
  router = Backbone.Marionette.AppRouter.extend(
    controller: controller
    
    initialize: (options) ->
      @bind 'route', @track
    
    appRoutes:
      "internal": "home"
      
  )
  controller =
    home: ->
      self = this
      params = mode: "stream"
      require ["js/modules/internal/views/home"], (view) ->
        self.toss view, params

    toss: (view, params) ->
      data =
        view: view
        params: params
        id: "stream"

      Backbone.Events.trigger "module", data, this

  new router(controller: controller)
