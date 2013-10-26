// Generated by CoffeeScript 1.6.2
(function() {
  define(["jquery", "underscore", "backbone", "js/modules/stream/models/post", "text!html/stream/single.html", "js/modules/stream/views/heading", "js/models/types"], function($, _, Backbone, model, template, vHeading, mTypes) {
    var view;

    view = Backbone.View.extend({
      className: "single",
      initialize: function(options) {
        return this.load(options.id);
      },
      load: function(id) {
        var self;

        console.log(id);
        this.model = new model({
          id: id
        });
        self = this;
        return this.model.fetch({
          success: function() {
            return self.render();
          },
          error: function(model, response) {
            return Backbone.Events.trigger({
              response: response,
              location: "modules/stream/views/single",
              action: "read",
              type: "error"
            });
          }
        });
      },
      render: function() {
        var compiled, data, element, type;

        data = this.model.toJSON();
        if (!_.isUndefined(data.meta)) {
          type = data.meta.type;
          element = mTypes.get_parent(type);
          Backbone.Events.trigger("sidebar", "single");
          compiled = _.template(template, {
            data: data,
            meta: data.meta,
            post: data.post,
            user: data.user,
            element: element
          });
          this.$el.html(compiled);
          this.subviews({
            "#heading": new vHeading({
              model: this.model
            })
          });
          return compiled;
        }
      }
    });
    return view;
  });

}).call(this);
