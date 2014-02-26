// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone"], function($, _, Backbone) {
  var pages;

  return pages = {
    slug: "pages",
    path: function() {
      return "modules/{{@slug}}/";
    },
    pages: function() {
      var params, self;

      self = this;
      params = {
        params: settings
      };
      return require(["pages"], function(view) {
        return self.toss(view, params);
      });
    },
    page: function(path) {
      var params, self;

      self = this;
      params = {
        path: path
      };
      return require(["js/modules/pages/views/page"], function(view) {
        return self.toss(view, params);
      });
    },
    add: function() {
      var params, self;

      self = this;
      params = {
        mode: "add"
      };
      return require(["form"], function(view) {
        return self.toss(view, params);
      });
    },
    edit: function(id) {
      var params, self;

      self = this;
      params = {
        id: id,
        mode: "edit"
      };
      return require(["form"], function(view) {
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
