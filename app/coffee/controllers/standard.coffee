define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  
  standard =
    homepage: ->
      self = @
      params = page: "home"
      require ["js/modules/standard/views/home"], (view) ->
        self.toss view, params

    about: ->
      self = @
      params = page: "about"
      require ["js/modules/standard/views/about"], (view) ->
        self.toss view, params
        
    contact: ->
      self = @
      params = page: "contact"
      require ["js/modules/standard/views/contact"], (view) ->
        self.toss view, params

    signup: ->
      self = @
      params = page: "signup"
      require ["js/modules/standard/views/signup"], (view) ->
        self.toss view, params
        
    help: ->
      self = @
      params = {}
      require ["js/modules/standard/views/help"], (view) ->
        self.toss view, params
    
    standard: ->
      self = @
      params = page: "standard"
      require ["js/modules/standard/views/standard"], (view) ->
        self.toss view, params


    temp: ->
      self = @
      params = page: "temp"
      require ["js/modules/standard/views/temp"], (view) ->
        self.toss view, params

    terms: ->
      self = @
      params = page: "terms"
      require ["js/modules/standard/views/terms"], (view) ->
        self.toss view, params
    
    privacy: ->
      self = @
      params = page: "privacy"
      require ["js/modules/standard/views/privacy"], (view) ->
        self.toss view, params
        
    user: (id) ->
      self = @
      params =
        user: id

      require ["js/modules/standard/views/user"], (view) ->
        self.toss view, params
    
    history: () ->
      self = @
      params = {}
      require ["js/views/history"], (view) ->
        self.toss view, params

    notifications: () ->
      self = @
      params = {}
      require ["js/views/notifications"], (view) ->
        self.toss view, params
        
    ### NEED TO EXTEND APPROUTER ###  
    toss: (view, params) ->
      data =
        view: view
        params: params
        id: "orgs"

      Backbone.Events.trigger "module", data, @