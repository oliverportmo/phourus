// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone"], function($, _, Backbone) {
  var model;

  model = Backbone.Model.extend({
    urlRoot: function() {
      return "/rest/address/";
    }
  });
  return model;
});
