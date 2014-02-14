define ["jquery", "underscore", "backbone", "marionette"], ($, _, Backbone, marionette, init) ->
  router = Backbone.Marionette.AppRouter.extend(
    controller: controller
    
    initialize: (options) ->
      @bind 'route', @track
    
    appRoutes:
      "contacts/:page": "contacts"
      "finance/:page": "finance"
      "more/:page": "more"
  )
  
  controller =
    contacts: (page) ->
      self = this
      params = {}
      require ["js/modules/internal/views/contacts/" + page], (view) ->
        self.toss view, params

    finance: (page) ->
      self = this
      params = {}
      require ["js/modules/internal/views/finance/" + page], (view) ->
        self.toss view, params
        
    more: (page) ->
      self = this
      params = {}
      require ["js/modules/internal/views/more/" + page], (view) ->
        self.toss view, params
        
    toss: (view, params) ->
      data =
        view: view
        params: params
        id: "internal"

      Backbone.Events.trigger "module", data, this

  new router(controller: controller)
