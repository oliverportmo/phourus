// Generated by CoffeeScript 1.6.2
define(["jquery", "backbone", "underscore"], function($, Backbone, _) {
  var collection;

  collection = Backbone.Collection.extend({
    serialize: function(obj) {
      var p, str;

      str = [];
      for (p in obj) {
        str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
      }
      return str.join("&");
    }
  });
  return collection;
});
