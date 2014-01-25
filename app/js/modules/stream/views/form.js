// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone", "forms", "text!html/stream/form.html", "text!html/headings/post.html", "text!html/headings/user.html", "js/modules/stream/models/post", "js/models/types", "js/models/session"], function($, _, Backbone, forms, tForm, tPostHeading, tUserHeading, mPost, mTypes, mSession) {
  var view;

  view = Backbone.View.extend({
    className: "form",
    initialize: function(options) {
      this.options = options;
      return this.model = new mPost(options);
    },
    events: {
      "click .back": "back",
      "click #create": "create",
      "click #update": "update",
      "click #delete": "delete"
    },
    render: function() {
      var self;

      self = this;
      $("#mask").show();
      Backbone.Events.trigger("sidebar", "form");
      if (_.isUndefined(mSession.get("user_id"))) {
        this.$el.html('<h2 style="text-align: center">You must log in to create or modify posts.</h2>');
        return;
      }
      if (this.options.mode === "add") {
        this.model.clear();
        this.display("add");
        $("#mask").hide();
      }
      if (this.options.mode === "edit") {
        this.model.fetch({
          success: function(model, response) {
            var owner;

            $("#mask").hide();
            owner = model.get("meta").user_id;
            if (!_.isUndefined(mSession.get("user_id")) && owner === mSession.get("user_id")) {
              self.options.type = model.get("meta").type;
              return self.display("edit");
            } else {
              return self.$el.html('<h2 style="text-align: center">You are not authorized to modify this post</h2>');
            }
          },
          error: function(model, response) {
            $("#mask").hide();
            if (response.status === 404) {
              self.$el.html('<h2 style="text-align: center">Post could not be found</h2>');
              Backbone.Events.trigger("alert", {
                type: "message",
                message: "Post could not be found",
                response: response,
                location: "modules/stream/views/form",
                action: "edit"
              });
            }
            if (response.status === 503) {
              return Backbone.Events.trigger("alert", {
                type: "error",
                message: "Post could not be loaded for editing",
                response: response,
                location: "modules/stream/views/form",
                action: "edit"
              });
            }
          }
        });
      }
      return this;
    },
    display: function(mode) {
      var compiled;

      this.options.description = mTypes.description(this.options.type);
      this.options.action = "Add";
      if (this.options.mode === "edit") {
        this.options.action = "Edit";
        this.options.title = this.options.type;
      }
      if (this.options.mode === "add") {
        this.options.title = this.options.type.slice(0, this.options.type.length - 1);
        if (this.options.type === "timeline") {
          this.options.title = "Timeline";
        }
      }
      compiled = _.template(tForm, {
        data: this.options
      });
      $(this.el).html(compiled);
      this.heading();
      return this.el;
    },
    heading: function() {
      var data, element, heading, owner, params, t, type, user;

      if (this.options.mode === 'add') {
        user = mSession.get("user");
        params = {
          user: user,
          pic: this.pic,
          format_date: this.format_date,
          owner: true
        };
        t = tUserHeading;
      }
      if (this.options.mode === 'edit') {
        data = this.model.toJSON();
        owner = data.meta.user_id === mSession.get("user_id");
        type = data.meta.type;
        element = mTypes.get_parent(type);
        params = {
          address: data.user.address[0],
          meta: data.meta,
          post: data.post,
          stats: data.stats,
          element: element,
          user: data.user.user,
          owner: owner,
          pic: this.pic,
          format_date: this.format_date
        };
        t = tPostHeading;
      }
      heading = _.template(t, params);
      $("div.heading").append(heading);
      return this.form();
    },
    form: function() {
      var container, m, schema;

      if (_.isUndefined(this.options.type)) {
        return;
      }
      m = this.model.get("post") || {};
      m.type = this.options.type;
      m.id = m.post_id;
      if (_.isUndefined(m.user_id)) {
        m.user_id = mSession.get("user_id");
      }
      if (m.user_id === !mSession.get("user_id")) {
        this.$el.html('<h2 style="text-align: center">You are not the owner of this post.</h2>');
        return;
      }
      this.model = new mPost(m);
      schema = mTypes.schema(this.options.type);
      console.log(schema);
      _.extend(this.model, {
        schema: schema
      });
      this.form = new Backbone.Form({
        schema: schema,
        model: this.model
      });
      this.form.render();
      container = this.$el.find("#fields");
      return container.append(this.form.el);
    },
    back: function() {
      return Backbone.Events.trigger("back", {});
    },
    create: function(e) {
      $("#mask").show();
      this.form.commit();
      return this.model.save({}, {
        success: function(model, response) {
          $("#mask").hide();
          return Backbone.Events.trigger("alert", {
            type: "complete",
            message: "Post created successfully",
            response: response,
            location: "modules/stream/views/form",
            action: "create"
          });
        },
        error: function(model, response) {
          $("#mask").hide();
          return Backbone.Events.trigger("alert", {
            type: "error",
            message: "Post could not be created",
            response: response,
            location: "modules/stream/views/form",
            action: "create"
          });
        }
      });
    },
    update: function(e) {
      $("#mask").show();
      this.form.commit();
      return this.model.save(this.model.changed, {
        success: function(model, response) {
          $("#mask").hide();
          return Backbone.Events.trigger("alert", {
            type: "complete",
            message: "Post saved successfully",
            response: response,
            location: "modules/stream/views/form",
            action: "update"
          });
        },
        error: function(model, response) {
          $("#mask").hide();
          return Backbone.Events.trigger("alert", {
            type: "error",
            message: "Post could not be updated",
            response: response,
            location: "modules/stream/views/form",
            action: "update"
          });
        }
      });
    },
    "delete": function(e) {
      $("#mask").show();
      return this.model.destroy({
        success: function(model, response) {
          $("#mask").hide();
          return Backbone.Events.trigger("alert", {
            type: "complete",
            message: "Post deleted successfully",
            response: response,
            location: "modules/stream/views/form",
            action: "delete"
          });
        },
        error: function(model, response) {
          $("#mask").hide();
          return Backbone.Events.trigger("alert", {
            type: "error",
            message: "Post could not be deleted",
            response: response,
            location: "modules/stream/views/form",
            action: "delete"
          });
        }
      });
    }
  });
  return view;
});
