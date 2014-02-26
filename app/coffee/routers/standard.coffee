define ["jquery", "underscore", "backbone", "marionette"], ($, _, Backbone, marionette) ->
  router = Backbone.Marionette.AppRouter.extend(
    
    initialize: (options) ->
      @bind 'route', @track
      
    appRoutes:
      "": "homepage"
      "!home": "homepage"
      "!about": "about"
      #"!help": "help"
      "!contact": "contact"
      "terms": "terms"
      "privacy": "privacy"
      
      #User
      "!signup": "signup"
      #"me": "user"
      "user/:id": "user"
      "!history": "history"
      "!notifications": "notifications"
            
      #Page
      #":page": "page"
      
  )