// Generated by CoffeeScript 1.6.2
var __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

define(["jquery", "underscore", "backbone", "js/models/types"], function($, _, Backbone, mTypes) {
  var vSidebar;

  vSidebar = Backbone.View.extend({
    el: "#sidebar",
    initialize: function(options) {
      var self;

      self = this;
      this.subdomain = options.subdomain;
      Backbone.Events.on("sidebar", function(params) {
        if (_.isObject(params)) {
          self.type = params.type;
          self.params = params;
        } else {
          self.type = params;
        }
        return self.render();
      });
      return window.onhashchange = function() {};
    },
    hide: function() {
      return this.$el.hide();
    },
    show: function() {
      return this.$el.show();
    },
    render: function() {
      var html, self, _ref;

      self = this;
      html = '';
      if (!_.isUndefined(self.sidebar)) {
        self.sidebar.clear();
      }
      this.show();
      if (_ref = this.subdomain, __indexOf.call(this.subdomains, _ref) >= 0) {
        require(["js/views/sidebar/subdomains/" + this.subdomain], function(view) {
          return self.sidebar = new view();
        });
      } else if (this.type === '' || _.isUndefined(this.type) || this.type === 'hidden') {
        this.hide();
      } else if (this.type === 'form') {
        require(["js/views/sidebar/form"], function(view) {
          return self.sidebar = new view({
            type: self.post
          });
        });
      } else if (this.type === 'orgs') {
        require(["js/views/sidebar/orgs"], function(view) {
          return self.sidebar = new view(self.params);
        });
      } else {
        require(["js/views/sidebar/" + this.type], function(view) {
          return self.sidebar = new view();
        });
      }
      return this.type = '';
    },
    subdomains: ["docs", "wiki", "internal", "agency"]
  });
  return vSidebar;
});
