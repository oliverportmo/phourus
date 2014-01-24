// Generated by CoffeeScript 1.6.2
var __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

define(["jquery", "underscore", "backbone", "text!html/orgs/org.html", "text!html/headings/org.html", "js/modules/orgs/models/org", "text!html/404/org.html"], function($, _, Backbone, template, tHeading, model, org404) {
  var view;

  view = Backbone.View.extend({
    initialize: function(options) {
      return this.options = options;
    },
    events: {
      "click .back": "back"
    },
    back: function() {
      return Backbone.Events.trigger("back", {});
    },
    render: function() {
      var params, self;

      self = this;
      this.model = new model({
        id: this.options.id
      });
      params = {
        org_type: this.options.type,
        page: this.options.page,
        id: this.options.id
      };
      Backbone.Events.trigger("sidebar", {
        type: 'default',
        params: params
      });
      return this.model.fetch({
        success: function() {
          return self.display();
        },
        error: function(model, response) {
          if (response.status === 404) {
            self.$el.html(_.template(org404, {}));
          }
          if (response.status === 503) {
            return Backbone.Events.trigger("alert", {
              type: "error",
              message: "Org could not be loaded",
              response: response,
              location: "modules/orgs/views/org",
              action: "read"
            });
          }
        }
      });
    },
    display: function() {
      var compiled, data, heading, info, _ref;

      data = this.model.toJSON();
      this.options.org = data;
      compiled = _.template(template, data);
      this.$el.html(compiled);
      heading = _.template(tHeading, {
        org: data.org,
        stats: data.stats,
        pic: this.pic
      });
      $(".heading").html(heading);
      this.page(this.options);
      $("ul.tabs a").removeClass('selected');
      if (this.options.page === 'posts' || this.options.page === 'users') {
        $("div#org_menu").removeClass('show');
        $("div#widgets").addClass('full');
        $("ul.tabs a#tabs_" + this.options.page).addClass('selected');
      } else {
        $("div#org_menu").addClass('show');
        $("div#widgets").removeClass('full');
        $("div#org_menu ul").hide();
        info = ['about', 'social', 'reviews', 'clout', 'contact', 'events'];
        if (_ref = this.options.page, __indexOf.call(info, _ref) >= 0) {
          $("ul.tabs a#tabs_info").addClass('selected');
          $("div#org_menu ul.info").show();
        } else {
          $("ul.tabs a#tabs_extras").addClass('selected');
          $("div#org_menu ul.extras").show();
        }
      }
      return compiled;
    }
  });
  return view;
});
