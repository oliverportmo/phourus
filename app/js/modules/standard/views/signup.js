// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone", "forms", "text!html/standard/signup.html", "text!html/email/signup.html", "js/modules/standard/models/user", "js/models/email", "js/models/types"], function($, _, Backbone, forms, template, tSignup, mUser, mEmail, mTypes) {
  var view;

  view = Backbone.View.extend({
    events: {
      "click .register": "register"
    },
    render: function() {
      var compiled, container, data, schema;

      data = {};
      Backbone.Events.trigger("sidebar", "general");
      compiled = _.template(template, data);
      this.$el.html(compiled);
      this.model = new mUser();
      schema = mTypes.schema('signup');
      _.extend(this.model, {
        schema: schema
      });
      this.form = new Backbone.Form({
        schema: schema,
        model: this.model
      });
      this.form.render();
      container = this.$el.find("#fields");
      container.append(this.form.el);
      return this;
    },
    register: function(e) {
      var data, self;

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
        data = this.model.attributes;
        delete data.terms;
        return this.model.save(data, {
          success: function(model, response) {
            self.email(data);
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
