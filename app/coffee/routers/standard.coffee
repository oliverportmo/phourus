define ["jquery", "underscore", "backbone", "marionette"], ($, _, Backbone, marionette) ->
  router = Backbone.Marionette.AppRouter.extend(
    controller: controller
    
    initialize: (options) ->
      @bind 'route', @track
      
    appRoutes:
      "": "homepage"
      "!home": "homepage"
      #"!help": "help"
      "!contact": "contact"
      "terms": "terms"
      "privacy": "privacy"
      
      #User
      "!signup": "signup"
      #"me": "user"
      "user/:id": "user"
      
      #Elements
      "!core": "standard"
      "!earth": "standard"
      "!mind": "standard"
      "!voice": "standard"
      "!self": "standard"
      
      #Page
      #":page": "page"
      
  )
  controller =
    homepage: ->
      self = this
      params = page: "home"
      require ["js/modules/standard/views/home"], (view) ->
        self.toss view, params

    contact: ->
      self = this
      params = page: "contact"
      require ["js/modules/standard/views/contact"], (view) ->
        self.toss view, params

    signup: ->
      self = this
      params = page: "signup"
      require ["js/modules/standard/views/signup"], (view) ->
        self.toss view, params
        
    help: ->
      self = this
      params = {}
      require ["js/modules/standard/views/help"], (view) ->
        self.toss view, params
    
    standard: ->
      self = this
      params = page: "standard"
      require ["js/modules/standard/views/standard"], (view) ->
        self.toss view, params


    temp: ->
      self = this
      params = page: "temp"
      require ["js/modules/standard/views/temp"], (view) ->
        self.toss view, params

    terms: ->
      self = this
      params = page: "terms"
      require ["js/modules/standard/views/terms"], (view) ->
        self.toss view, params
    
    privacy: ->
      self = this
      params = page: "privacy"
      require ["js/modules/standard/views/privacy"], (view) ->
        self.toss view, params
        
    user: (id) ->
      self = this
      params =
        user: id

      require ["js/modules/standard/views/user"], (view) ->
        self.toss view, params
    
    page: (page) ->
      console.log "Route page:" + page
      self = this
      params = page: page
      require ["js/modules/standard/views/page"], (view) ->
        self.toss view, params

    toss: (view, params) ->
      data =
        view: view
        params: params
        id: "standard"

      Backbone.Events.trigger "module", data, this

  new router(controller: controller)
