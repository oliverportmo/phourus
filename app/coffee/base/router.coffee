define ["jquery", "backbone", "marionette", "underscore", "analytics", "js/models/session"], ($, Backbone, marionette, _, analytics, mSession) ->
  router = Backbone.Marionette.AppRouter.extend({
      
    track: (e) ->
      url = Backbone.history.getFragment()
      _gaq.push(['_trackPageview', "/#{url}"]) 
  
  })
  Backbone.Marionette.AppRouter = router