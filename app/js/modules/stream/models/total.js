// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone", "js/models/session", "js/models/settings"], function($, _, Backbone, mSession, mSettings) {
  var mTotal;

  mTotal = Backbone.Model.extend({
    url: function() {
      var url;

      url = "/rest/post/" + this.query();
      return url;
    },
    query: function() {
      var keys, string;

      string = "";
      keys = _.keys(mSettings.attributes);
      _.each(keys, function(key) {
        return string += key + "=" + mSettings.attributes[key] + "&";
      });
      string += "&count=true";
      if (!_.isUndefined(mSession.get("token"))) {
        string += "&token=" + mSession.get("token") + ",";
      }
      string = "?" + string.substring(0, string.length - 1);
      return string;
    },
    idAttribute: "id"
  });
  return mTotal;
});
