// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone", "storage"], function($, _, Backbone, storage) {
  var mSession;

  mSession = Backbone.Model.extend({
    idAttribute: 'id',
    url: function() {
      return "/rest/session";
    },
    initialize: function() {
      Backbone._sync = Backbone.sync;
      return this.on("change", this.update);
    },
    local: function() {
      var data;

      if (!_.isNull(localStorage.getItem("session"))) {
        if (this.expired()) {
          localStorage.removeItem("session");
          this.clear();
        } else {
          data = $.parseJSON(localStorage.getItem("session"));
          this.set(data);
        }
      }
      return this.update();
    },
    update: function() {
      var self, token, user_id;

      self = this;
      token = 'guest';
      user_id = 0;
      if (!_.isUndefined(this.get("id"))) {
        token = this.get("id");
      }
      if (!_.isUndefined(this.get("user_id"))) {
        user_id = this.get("user_id");
      }
      return Backbone.Events.trigger("token", {
        token: token,
        user_id: user_id
      });
    },
    expired: function() {
      var expired, expires, now;

      expires = this.get("expires");
      now = this.now();
      expired = expires < now;
      return expired;
    },
    now: function() {
      var date, output;

      date = new Date().toISOString();
      output = date.replace("T", " ");
      output = output.split(".");
      return output[0];
    }
  });
  return new mSession();
});
