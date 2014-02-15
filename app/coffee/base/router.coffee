define ["jquery", "backbone", "marionette", "underscore", "analytics", "js/models/session"], ($, Backbone, marionette, _, analytics, mSession) ->
  router = Backbone.Marionette.AppRouter.extend({
      
    track: (e) ->
      url = Backbone.history.getFragment()
      _gaq.push(['_trackPageview', "/#{url}"]) 
    
    ###
    route: (route, name, callback) ->          
      Backbone.Router.prototype.route.call @, route, name, () ->
        if mSession.auth() isnt false
          console.log 'logged in'
          callback.apply @, arguments
        else
          if name is 'about'
            aboutcb.apply @, arguments
          else
            homecb.apply @, arguments
          console.log 'not logged in'
    ###
  
  })
  Backbone.Marionette.AppRouter = router