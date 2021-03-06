// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone"], function($, _, Backbone) {
  var standard;

  return standard = {
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
    history: function() {
      var params, self;

      self = this;
      params = {};
      return require(["js/views/history"], function(view) {
        return self.toss(view, params);
      });
    },
    notifications: function() {
      var params, self;

      self = this;
      params = {};
      return require(["js/views/notifications"], function(view) {
        return self.toss(view, params);
      });
    },
    /* NEED TO EXTEND APPROUTER
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
  };
});
