// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone", "forms", "text!html/orgs/signup.html", "js/modules/orgs/models/org", "js/models/types"], function($, _, Backbone, forms, template, mOrg, mTypes) {
  var view;

  view = Backbone.View.extend({
    events: {
      "click .back": "back",
      "click .signup": "signup"
    },
    render: function() {
      var compiled, container, data, schema;

      data = {};
      Backbone.Events.trigger("sidebar", "general");
      compiled = _.template(template, data);
      this.$el.html(compiled);
      this.model = new mOrg();
      schema = mTypes.schema('signuporg');
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
    back: function() {
      return Backbone.Events.trigger("back", {});
    },
    signup: function(e) {
      return this.create();
    },
    create: function() {
      var data, self;

      self = this;
      this.form.commit();
      if (!_.isNull(this.form.validate())) {
        return Backbone.Events.trigger("alert", {
          type: "error",
          message: "There were errors with the form data you entered, please correct these in order to continue",
          response: '',
          location: "modules/orgs/views/signup",
          action: "validate"
        });
      } else {
        data = this.model.attributes;
        delete data.terms;
        return this.model.save(data, {
          success: function(model, response) {
            Backbone.Events.trigger("alert", {
              type: "complete",
              message: "Org signup complete",
              response: response,
              location: "modules/orgs/views/signup",
              action: "create"
            });
            return $(self.el).html("<h2 style='text-align: center'>Signup is complete. Please check the email you provided for your login information.</h2>");
          },
          error: function(model, response) {
            return Backbone.Events.trigger("alert", {
              type: "error",
              message: "Org could not be created",
              response: response,
              location: "modules/orgs/views/signup",
              action: "create"
            });
          }
        });
      }
    }
  });
  return view;
});
