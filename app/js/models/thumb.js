// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone"], function($, _, Backbone) {
  var model;

  model = Backbone.Model.extend({
    initialize: function(options) {
      return this.options = options;
    },
    url: function() {
      var query;

      query = '?' + this.serialize(this.options);
      return "/rest/thumb/" + query;
    }
  });
  return model;
});
