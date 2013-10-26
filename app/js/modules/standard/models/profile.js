// Generated by CoffeeScript 1.6.2
(function() {
  define(["jquery", "underscore", "backbone"], function($, _, Backbone) {
    var model;

    model = Backbone.Model.extend({
      initialize: function(options) {
        return this.options = options;
      },
      url: function() {
        var url;

        url = "/rest/users/?id=" + this.options.id;
        return url;
      },
      idAttribute: "id"
    });
    return model;
  });

}).call(this);
