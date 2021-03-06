// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone", "marionette"], function($, _, Backbone, marionette) {
  var router;

  return router = Backbone.Marionette.AppRouter.extend({
    initialize: function(options) {
      this.bind('route', this.track);
      this.route('!orgs/signup', "orgs", options.controller.signup);
      this.route('!orgs/admin', "orgs", options.controller.admin);
      this.route(/^!(companies|govs|groups|schools)\/(.*?)$/, "orgs", options.controller.orgs);
      this.route(/^!(companies|govs|groups|schools)$/, "orgs", options.controller.orgs);
      this.route(/^!(company|gov|group|school)\/(.*?)$/, "orgs", options.controller.org);
      return this.route(/^!(company|gov|group|school)\/(.*?)\/(.*?)$/, "orgs", options.controller.org);
    },
    /* NEED TO EXTEND APPROUTER, ORGS DIFFERENT PERHAPS BECAUSE OF appRoutes
    */

    toss: function(view, params) {
      var data;

      data = {
        view: view,
        params: params,
        id: "orgs"
      };
      return Backbone.Events.trigger("module", data, this);
    }
  });
});
