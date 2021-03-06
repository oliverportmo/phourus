// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone", "forms", "js/modules/standard/models/user", "js/models/types", "js/models/headers"], function($, _, Backbone, forms, mUser, mTypes, mHeaders) {
  var view;

  view = Backbone.View.extend({
    render: function() {
      var schema;

      this.model = new mUser();
      if (this.options.type === 'short') {
        schema = mTypes.schema('short-signup');
      } else {
        schema = mTypes.schema('signup');
      }
      _.extend(this.model, {
        schema: schema
      });
      this.form = new Backbone.Form({
        schema: schema,
        model: this.model
      });
      this.form.render();
      return this.form.el;
    },
    register: function(e) {
      var data, email, encoded, m, password, self;

      self = this;
      this.form.commit();
      if (!_.isNull(this.form.validate())) {
        return Backbone.Events.trigger("alert", {
          type: "error",
          message: "There were errors with the form data you entered, please correct these in order to continue",
          response: '',
          location: "modules/standard/views/signup",
          action: "validate"
        });
      } else {
        data = {};
        email = this.form.getValue('email');
        password = this.form.getValue('password');
        encoded = btoa(email + ":" + password);
        m = new mUser();
        mHeaders.set("Authentication", "Basic " + encoded);
        return m.save(data, {
          success: function(model, response) {
            Backbone.Events.trigger("alert", {
              type: "complete",
              message: "User signup complete",
              response: response,
              location: "modules/standard/views/signup",
              action: "create"
            });
            return $(self.el).html("<h2 style='text-align: center'>Signup is complete. Please check the email you provided for your login information.</h2>");
          },
          error: function(model, response) {
            return Backbone.Events.trigger("alert", {
              type: "error",
              message: "User account could not be created",
              response: response,
              location: "modules/standard/views/signup",
              action: "create"
            });
          }
        });
      }
    }
  });
  return view;
});
