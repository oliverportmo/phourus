// Generated by CoffeeScript 1.6.2
(function() {
  define(["jquery", "underscore", "backbone", "text!html/sidebar/admin.html"], function($, _, Backbone, template) {
    var view;

    view = Backbone.View.extend({
      el: "#sidebar",
      className: "admin",
      initialize: function(options) {
        return this.render();
      },
      render: function() {
        var compiled;

        compiled = _.template(template, '');
        $(this.el).append(compiled);
        return compiled;
      }
    });
    return view;
  });

}).call(this);
