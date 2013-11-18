// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone", "marionette"], function($, _, Backbone, marionette, init) {
  var controller, router;

  router = Backbone.Marionette.AppRouter.extend({
    controller: controller,
    initialize: function(options) {
      this.bind('route', this.track);
      this.route('!orgs/signup', "orgs", options.controller.signup);
      this.route('!orgs/admin', "orgs", options.controller.admin);
      this.route(/^!(companies|govs|groups|schools)\/(.*?)$/, "orgs", options.controller.orgs);
      this.route(/^!(companies|govs|groups|schools)$/, "orgs", options.controller.orgs);
      this.route(/^!(company|gov|group|school)\/(.*?)$/, "orgs", options.controller.org);
      return this.route(/^!(company|gov|group|school)\/(.*?)\/(.*?)$/, "orgs", options.controller.org);
    },
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
  controller = {
    orgs: function(type, query) {
      var params, self, settings;

      if (!_.isUndefined(query)) {
        settings = query;
      }
      self = this;
      params = {
        section: "home",
        type: type,
        params: settings
      };
      return require(["js/modules/orgs/views/home"], function(view) {
        return self.toss(view, params);
      });
    },
    org: function(type, id, page) {
      var params, self;

      self = this;
      if (_.isUndefined(page) || page === "") {
        page = "about";
      }
      params = {
        id: id,
        type: type,
        page: page
      };
      return require(["js/modules/orgs/views/org"], function(view) {
        return self.toss(view, params);
      });
    },
    signup: function() {
      var params, self;

      self = this;
      params = {
        section: "signup",
        params: ""
      };
      return require(["js/modules/orgs/views/signup"], function(view) {
        return self.toss(view, params);
      });
    },
    admin: function() {
      var params, self;

      self = this;
      params = {
        section: "admin",
        params: ""
      };
      return require(["js/modules/orgs/views/admin"], function(view) {
        return self.toss(view, params);
      });
    }
  };
  return new router({
    controller: controller
  });
});