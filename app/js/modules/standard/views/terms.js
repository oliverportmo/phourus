// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone", "text!html/standard/terms.html"], function($, _, Backbone, template) {
  var vTemp;

  vTemp = Backbone.View.extend({
    className: 'terms',
    initialize: function() {},
    render: function() {
      var compiled, data;

      data = {};
      Backbone.Events.trigger("sidebar", "general");
      compiled = _.template(template, data);
      this.$el.html(compiled);
      return compiled;
    }
  });
  return vTemp;
});
