// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone", "text!html/sidebar/map.html"], function($, _, Backbone, template) {
  var raw, view;

  raw = {
    "arizona": 21,
    "california": 25,
    "colorado": 13,
    "massachusetts": 27,
    "new hampshire": 7
  };
  view = Backbone.View.extend({
    el: "#sidebar",
    className: "map",
    initialize: function(options) {
      return this.render();
    },
    events: {
      "click a": "select",
      "click button#zipcode": "zip"
    },
    select: function(e) {
      return Backbone.Events.trigger("location", e.currentTarget.id);
    },
    zip: function(e) {
      return Backbone.Events.trigger("location", $("input#zip").val());
    },
    render: function() {
      var compiled, data;

      data = {};
      data.regions = raw;
      compiled = _.template(template, {
        data: data
      });
      $(this.el).append(compiled);
      return compiled;
    }
  });
  return view;
});
