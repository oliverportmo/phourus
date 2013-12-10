// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone", "text!html/widgets/posts.html", "js/modules/orgs/collections/reviews", "js/views/alerts", "js/models/types", "text!html/orgs/shared/review.html", "text!html/404/reviews.html"], function($, _, Backbone, template, cReviews, vAlerts, mTypes, tReview, reviews404) {
  var widget;

  widget = Backbone.View.extend({
    initialize: function(options) {
      var self;

      self = this;
      options.id = options.id;
      options.page = 1;
      options.limit = 10;
      this.collection = new cReviews(options);
      return this.collection.fetch({
        success: function() {
          return self.render();
        },
        error: function(collection, response) {
          if (response.status === 404) {
            return self.$el.html(_.template(reviews404, {}));
          } else {
            return Backbone.Events.trigger("alert", {
              type: "error",
              message: "Reviews could not be loaded",
              response: response,
              location: "modules/orgs/shared/reviews",
              action: "read"
            });
          }
        }
      });
    },
    render: function() {
      var self;

      self = this;
      _.each(this.collection.models, function(model) {
        var data;

        data = model.toJSON();
        return $(self.el).append(_.template(tReview, {
          review: data.review,
          pic: self.pic,
          user: data.user.user,
          format_date: self.format_date
        }));
      });
      return this.$el;
    }
  });
  return widget;
});
