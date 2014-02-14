// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone", "text!html/internal/more/analytics.html"], function($, _, Backbone, template) {
  var view;

  view = Backbone.View.extend({
    className: "analytics",
    initialize: function(options) {},
    render: function() {
      var compiled, data;

      Backbone.Events.trigger("sidebar", {
        type: 'internal',
        params: this.options
      });
      data = {};
      compiled = _.template(template, data);
      $(this.el).append(compiled);
      return compiled;
    }
  });
  return view;
});
