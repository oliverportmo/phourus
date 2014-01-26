// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone", "js/modules/stream/views/filter", "js/views/elements", "js/views/alerts", "js/modules/stream/collections/posts", "text!html/stream/stream.html", "text!html/items/post.html", "js/models/types", "js/models/settings", "js/models/session", "text!html/404/posts.html"], function($, _, Backbone, vFilter, vElements, vAlerts, cPosts, tStream, tPost, mTypes, mSettings, mSession, posts404) {
  var view;

  view = Backbone.View.extend({
    className: "stream",
    initialize: function() {
      _.bindAll(this);
      mSettings.bind("change", this.filter);
      if (_.isUndefined(this.options.org)) {
        mSettings.set("org_id", 0);
      } else {
        mSettings.set("org_id", this.options.org.id);
      }
      return Backbone.Events.trigger("sidebar", 'default');
    },
    events: {
      "click #customize": "customize",
      "click #advanced": "advanced",
      "click #search": "search"
    },
    search: function() {
      var term;

      term = $("#term").val();
      return mSettings.set("search", term);
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
    advanced: function() {
      return $("#filter").toggle();
    },
    filter: function() {
      var self;

      this.collection = new cPosts();
      self = this;
      $("#mask").show();
      return this.collection.fetch({
        success: function() {
          $("#mask").hide();
          return self.update();
        },
        error: function(collection, response) {
          var auth;

          $("#mask").hide();
          if (response.status === 404 || response.status === 503) {
            auth = _.isUndefined(mSession.get("id")) || _.isUndefined(mSession.get("user_id")) || mSession.get("user_id");
            if (auth === 0) {
              return $("#stream").html("<h2 style='text-align: center'>You must be logged-in to see posts from your friends, followers, and those following you.</h2>");
            } else {
              return $("#stream").html(_.template(posts404, {
                auth: auth
              }));
            }
          }
        }
      });
    },
    update: function() {
      var self;

      self = this;
      $("#stream").html("");
      return _.each(this.collection.models, function(model) {
        var data, owner, positive;

        data = model.toJSON();
        if (!_.isUndefined(data.meta)) {
          data.meta.element = mTypes.get_parent(data.meta.type);
          if (parseInt(data.stats.thumbs) === 0) {
            positive = 0;
          } else {
            positive = (parseInt(data.stats.positive) / parseInt(data.stats.thumbs)) * 100;
          }
          owner = false;
          if (data.user.user.id === mSession.get("user_id")) {
            owner = true;
          }
          return $("#stream").append(_.template(tPost, {
            user: data.user.user,
            meta: data.meta,
            post: data.post,
            address: data.user.address[0],
            stats: data.stats,
            pic: self.pic,
            owner: owner,
            positive: positive,
            format_date: self.format_date
          }));
        }
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
