// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone", "text!html/standard/contact.html", "firefly"], function($, _, Backbone, template, firefly) {
  var view;

  view = Backbone.View.extend({
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
  return view;
});
