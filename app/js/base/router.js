// Generated by CoffeeScript 1.6.2
(function() {
  define(["jquery", "backbone", "marionette", "underscore", "analytics", "js/models/session"], function($, Backbone, marionette, _, analytics, mSession) {
    var router;

    router = Backbone.Marionette.AppRouter.extend({
      track: function(e) {
        var url;

        url = Backbone.history.getFragment();
        return _gaq.push(['_trackPageview', "/" + url]);
      }
    });
    return Backbone.Marionette.AppRouter = router;
  });

}).call(this);
