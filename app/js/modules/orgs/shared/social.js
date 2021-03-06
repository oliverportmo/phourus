// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone", "text!html/orgs/shared/social.html", "js/modules/orgs/models/social"], function($, _, Backbone, template, mSocial) {
  var widget;

  widget = Backbone.View.extend({
    initialize: function(options) {
      return this.model = new mSocial;
    },
    render: function() {
      var compiled, data;

      data = this.model.toJSON();
      compiled = _.template(template, {
        data: data
      });
      $(this.el).append(compiled);
      return compiled;
    }
  });
  return widget;
});
