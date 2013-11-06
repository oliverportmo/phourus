// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone", "js/modules/stream/models/comment", "js/models/session", "js/models/settings"], function($, _, Backbone, mComment, mSession, mSettings) {
  var collection;

  collection = Backbone.Collection.extend({
    url: function() {
      var url;

      url = "/rest/comments/?post_id=" + this.post_id;
      return url;
    },
    idAttribute: "id"
  });
  return collection;
});
