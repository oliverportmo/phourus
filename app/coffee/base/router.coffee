define ["jquery", "backbone", "marionette", "underscore", "analytics"], ($, Backbone, marionette, _, analytics) ->
  router = Backbone.Marionette.AppRouter.extend({
    
    track: (e) ->
      url = Backbone.history.getFragment()
      _gaq.push(['_trackPageview', "/#{url}"]) 
  
  })
  Backbone.Marionette.AppRouter = router