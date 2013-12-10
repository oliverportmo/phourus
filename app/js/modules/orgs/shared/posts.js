// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone", "text!html/widgets/posts.html", "js/modules/orgs/collections/posts", "js/models/types", "text!html/items/post.html", "text!html/404/posts.html"], function($, _, Backbone, template, cPosts, mTypes, tPost, posts404) {
  var widget;

  widget = Backbone.View.extend({
    initialize: function(options) {
      var self;

      self = this;
      options.types = options.page;
      this.collection = new cPosts(options);
      return this.collection.fetch({
        success: function() {
          return self.render();
        },
        error: function(collection, response) {
          if (response.status === 404) {
            $(self.el).append(_.template(posts404, {}));
          }
          if (response.status === 503) {
            return Backbone.Events.trigger("alert", {
              type: "error",
              message: "Posts could not be loaded",
              response: response,
              location: "modules/orgs/shared/posts",
              action: "read"
            });
          }
        }
      });
    },
    render: function() {
      var l, self;

      self = this;
      l = this.collection.models.length;
      if (l === 0) {
        $(self.el).append('<h3 style="text-align: center;margin: 0px; padding: 0px">No posts were found based on your criteria</h3>');
      } else {
        _.each(this.collection.models, function(model) {
          var data;

          data = model.toJSON();
          data.meta.element = mTypes.get_parent(data.meta.type);
          return $(self.el).append(_.template(tPost, {
            post: data.post,
            meta: data.meta,
            owner: false,
            address: data.address,
            stats: data.stats,
            user: data.user.user,
            pic: self.pic
          }));
        });
      }
      return this.$el;
    }
  });
  return widget;
});
