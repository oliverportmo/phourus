// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone", "text!html/govs/widgets/financial.html"], function($, _, Backbone, template) {
  var widget;

  widget = Backbone.View.extend({
    initialize: function(options) {
      return this.render();
    },
    render: function() {
      var compiled, data;

      data = {};
      compiled = _.template(template, data);
      $(this.el).append(compiled);
      return compiled;
    }
  });
  return widget;
});
