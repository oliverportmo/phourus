// Generated by CoffeeScript 1.6.2
(function() {
  define(["jquery", "underscore", "backbone", "auth", "text!html/login.html", "text!html/logout.html", "js/models/login", "js/models/session", "js/models/settings"], function($, _, Backbone, auth, tLogin, tLogout, mLogin, mSession, mSettings) {
    var view;

    view = Backbone.View.extend({
      tagName: "div",
      initialize: function(options) {
        _.bindAll(this);
        mSession.on("change", this.render);
        return this.render();
      },
      events: {
        "click .login": "login",
        "click .logout": "logout",
        "click .me": "me"
      },
      render: function() {
        var compiled, data;

        data = mSession.attributes || {};
        if (!_.isEmpty(data) && !mSession.expired()) {
          compiled = _.template(tLogout, data);
        } else {
          compiled = _.template(tLogin, data);
        }
        this.$el.html(compiled);
        return compiled;
      },
      /* LOGIN
      */

      login: function() {
        var model, self;

        self = this;
        $("#mask").show();
        Backbone.BasicAuth.set($("input.email").val(), $("input.password").val());
        model = new mLogin();
        return model.save({}, {
          success: function(model, response) {
            if (response === false) {
              Backbone.Events.trigger("alert", {
                type: "message",
                message: "Login was unsuccessful, please try again",
                response: response,
                location: "views/login",
                action: "login"
              });
            } else {
              self.session(response);
            }
            return $("#mask").hide();
          },
          error: function(model, response) {
            Backbone.Events.trigger("alert", {
              type: "error",
              message: "Login was unsuccessful, please try again",
              response: response,
              location: "views/login",
              action: "login"
            });
            return $("#mask").hide();
          }
        });
      },
      session: function(response) {
        var session;

        session = JSON.stringify(response);
        localStorage.setItem("session", session);
        return location.reload(false);
      },
      /* LOGOUT
      */

      logout: function() {
        localStorage.removeItem("session");
        return location.reload(false);
      },
      form: function() {
        var output;

        output = {};
        output.email = $(".email").val();
        output.password = $(".password").val();
        return output;
      },
      me: function() {
        return mSettings.set("mode", "me");
      },
      send: function() {
        /*
        message = _.template(tPassword, 
          password: 123
          email: $("#email").val()
        )	 
        
        email = new mEmail(
          recipient_email: $("#email").val()
          subject: "Your Phourus Password"
          message: message
        )
        email.save
          success: ->
        
          error: ->
            vAlerts.add "message", "Password could not be sent.", "1", ""
        */

      }
    });
    return view;
  });

}).call(this);
