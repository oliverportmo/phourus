// Generated by CoffeeScript 1.6.2
(function() {
  define(["jquery", "underscore", "backbone", "js/modules/stream/views/filter", "js/views/elements", "js/views/alerts", "js/modules/stream/collections/posts", "text!html/stream/stream.html", "text!html/stream/post.html", "js/models/types", "js/models/settings"], function($, _, Backbone, vFilter, vElements, vAlerts, cPosts, tStream, tPost, mTypes, mSettings) {
    var view;

    view = Backbone.View.extend({
      className: "stream",
      initialize: function() {
        _.bindAll(this);
        mSettings.bind("change", this.filter);
        this.filter();
        return Backbone.Events.trigger("sidebar", 'stream');
      },
      events: {
        "click #customize": "customize"
      },
      customize: function(e) {
        var hidden;

        hidden = ($("#sidebar").css("display") === "none" ? true : false);
        if (hidden === true) {
          $("#customize").html("&laquo; Less Options");
          $("#sidebar").show();
          return $("#stream").css("width", "700px");
        } else {
          $("#customize").html("More Options &raquo;");
          $("#sidebar").hide();
          return $("#stream").css("width", "100%");
        }
      },
      filter: function() {
        var self;

        this.collection = new cPosts();
        self = this;
        return this.collection.fetch({
          success: function() {
            return self.update();
          },
          error: function(collection, response) {
            return Backbone.Events.trigger({
              response: response,
              location: "modules/stream/views/stream",
              action: "filter",
              type: "error"
            });
          }
        });
      },
      update: function() {
        var self;

        self = this;
        $("#stream").html("");
        return _.each(this.collection.models, function(model) {
          var data;

          data = model.toJSON();
          data.meta.element = mTypes.get_parent(data.meta.type);
          return $("#stream").append(_.template(tPost, {
            user: data.user,
            meta: data.meta,
            post: data.post,
            address: data.address,
            pic: self.pic
          }));
        });
      },
      render: function() {
        var compiled;

        compiled = _.template(tStream, {});
        this.$el.html(compiled);
        this.subviews("#filter", new vFilter());
        return this.el;
      }
    });
    return view;
  });

}).call(this);
