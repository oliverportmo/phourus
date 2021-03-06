// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone", "js/models/session", "js/models/settings"], function($, _, Backbone, mSession, mSettings) {
  var collection;

  collection = Backbone.Collection.extend({
    initialize: function(options) {
      this.options = {};
      if (!_.isUndefined(options.id)) {
        this.options.id = options.id;
      }
      if (!_.isUndefined(options.org_id)) {
        this.options.org_id = options.org_id;
      }
      if (!_.isUndefined(options.mode)) {
        this.options.mode = options.mode;
      }
      if (!_.isUndefined(options.type)) {
        return this.options.type = options.type;
      }
    },
    url: function() {
      var url;

      url = "/rest/community/?" + this.serialize(this.options);
      return url;
    },
    idAttribute: "id"
  });
  return collection;
});
