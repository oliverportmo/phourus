// Generated by CoffeeScript 1.6.2
(function() {
  define(["jquery", "underscore", "backbone", "marionette"], function($, _, Backbone, marionette) {
    var controller, router;

    router = Backbone.Marionette.AppRouter.extend({
      controller: controller,
      initialize: function(options) {
        return this.bind('route', this.track);
      },
      appRoutes: {
        "": "homepage",
        "!home": "homepage",
        "!about": "about",
        "!contact": "contact",
        "terms": "terms",
        "privacy": "privacy",
        "!signup": "signup",
        "user/:id": "user",
        "!core": "standard",
        "!earth": "standard",
        "!mind": "standard",
        "!voice": "standard",
        "!self": "standard"
      }
    });
    controller = {
      homepage: function() {
        var params, self;

        self = this;
        params = {
          page: "home"
        };
        return require(["js/modules/standard/views/home"], function(view) {
          return self.toss(view, params);
        });
      },
      about: function() {
        var params, self;

        self = this;
        params = {
          page: "about"
        };
        return require(["js/modules/standard/views/about"], function(view) {
          return self.toss(view, params);
        });
      },
      contact: function() {
        var params, self;

        self = this;
        params = {
          page: "contact"
        };
        return require(["js/modules/standard/views/contact"], function(view) {
          return self.toss(view, params);
        });
      },
      signup: function() {
        var params, self;

        self = this;
        params = {
          page: "signup"
        };
        return require(["js/modules/standard/views/signup"], function(view) {
          return self.toss(view, params);
        });
      },
      help: function() {
        var params, self;

        self = this;
        params = {};
        return require(["js/modules/standard/views/help"], function(view) {
          return self.toss(view, params);
        });
      },
      standard: function() {
        var params, self;

        self = this;
        params = {
          page: "standard"
        };
        return require(["js/modules/standard/views/standard"], function(view) {
          return self.toss(view, params);
        });
      },
      temp: function() {
        var params, self;

        self = this;
        params = {
          page: "temp"
        };
        return require(["js/modules/standard/views/temp"], function(view) {
          return self.toss(view, params);
        });
      },
      terms: function() {
        var params, self;

        self = this;
        params = {
          page: "terms"
        };
        return require(["js/modules/standard/views/terms"], function(view) {
          return self.toss(view, params);
        });
      },
      privacy: function() {
        var params, self;

        self = this;
        params = {
          page: "privacy"
        };
        return require(["js/modules/standard/views/privacy"], function(view) {
          return self.toss(view, params);
        });
      },
      user: function(id) {
        var params, self;

        self = this;
        params = {
          user: id
        };
        return require(["js/modules/standard/views/user"], function(view) {
          return self.toss(view, params);
        });
      },
      page: function(page) {
        var params, self;

        console.log("Route page:" + page);
        self = this;
        params = {
          page: page
        };
        return require(["js/modules/standard/views/page"], function(view) {
          return self.toss(view, params);
        });
      },
      toss: function(view, params) {
        var data;

        data = {
          view: view,
          params: params,
          id: "standard"
        };
        return Backbone.Events.trigger("module", data, this);
      }
    };
    return new router({
      controller: controller
    });
  });

}).call(this);
