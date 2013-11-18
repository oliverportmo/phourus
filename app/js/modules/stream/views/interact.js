// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone", "js/modules/stream/collections/comments", "text!html/stream/interact.html", "js/modules/stream/views/comment", "js/models/types", "js/models/session"], function($, _, Backbone, collection, template, vComment, mTypes, mSession) {
  var view;

  view = Backbone.View.extend({
    initialize: function(options) {
      _.bindAll(this);
      return this.options = options;
    },
    events: {
      "click button#test": "test"
    },
    render: function() {
      var compiled, session;

      session = mSession.toJSON();
      compiled = _.template(template, {
        session: session,
        pic: this.pic,
        user: session.user
      });
      this.$el.append(compiled);
      this.comments();
      return this;
    },
    comments: function() {
      var post_id, self;

      self = this;
      post_id = this.options.id;
      this.collection = new collection();
      this.collection.post_id = post_id;
      return this.collection.fetch({
        success: function(collection, response) {
          return _.each(collection.models, function(obj, key) {
            var v;

            v = new vComment();
            return $("#comments").append(v.render(obj).el);
          });
        },
        error: function(model, response) {
          if (response.status === 404) {
            self.$el.html('<h2 style="text-align: center">There are no comments for this post</h2>');
          }
          if (response.status === 503) {
            return Backbone.Events.trigger("alert", {
              type: "error",
              message: "Comments could not be loaded",
              response: response,
              location: "modules/stream/views/interact",
              action: "read"
            });
          }
        }
      });
    }
  });
  return view;
});