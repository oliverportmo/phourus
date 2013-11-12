// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone", "text!html/sidebar/post.html", "js/models/types", "js/modules/sidebar/widgets/recent", "js/modules/sidebar/widgets/create", "js/models/thumb", "js/models/session"], function($, _, Backbone, template, mTypes, vRecent, vCreate, model, mSession) {
  var view;

  view = Backbone.View.extend({
    el: "#sidebar",
    clasName: "post",
    initialize: function(options) {
      var params, self;

      self = this;
      params = {};
      params.post_id = options.id;
      params.user_id = mSession.get("user_id");
      this.model = new model(params);
      return this.model.fetch({
        success: function(model, response) {
          if (response.length > 1) {
            return Backbone.Events.trigger("alert", {
              type: "error",
              message: "Duplicate thumbs found",
              response: response,
              location: "modules/sidebar/post",
              action: "read"
            });
          } else {
            return self.render();
          }
        },
        error: function(model, response) {
          if (response.status === 404) {
            return self.render();
          } else {
            return Backbone.Events.trigger("alert", {
              type: "message",
              message: "There was an error loading thumbs",
              response: response,
              location: "modules/sidebar/post",
              action: "read"
            });
          }
        }
      });
    },
    events: {
      "click #plus": "thumb",
      "click #minus": "thumb"
    },
    thumb: function(e) {
      var id, positive;

      id = e.currentTarget.id;
      if (id === 'minus') {
        positive = 0;
      } else if (id === 'plus') {
        positive = 1;
      } else {
        return;
      }
      return this.send(positive);
    },
    send: function(positive) {
      var data;

      data = {};
      data.positive = positive;
      data.user_id = mSession.get("user_id");
      data.post_id = this.options;
      if (data.user_id === 0) {

      } else {
        this.model = new model();
        return this.model.save(data, {
          success: function(model, response) {},
          error: function(model, response) {}
        });
      }
    },
    render: function() {
      var compiled, data, m;

      if (!_.isUndefined(this.model.attributes)) {
        m = this.model.attributes;
      }
      data = {};
      data.positive = -1;
      if (!_.isUndefined(m[0])) {
        if (!_.isUndefined(m[0].positive)) {
          data.positive = m[0].positive;
        }
      }
      compiled = _.template(template, {
        data: data
      });
      $(this.el).append(compiled);
      this.subviews("#create", new vCreate());
      return compiled;
    }
  });
  return view;
});
