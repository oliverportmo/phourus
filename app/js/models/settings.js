// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone"], function($, _, Backbone) {
  var mSettings;

  mSettings = Backbone.Model.extend({
    defaults: {
      debug: false,
      sort: "influence",
      direction: "DESC",
      type: "stream",
      mode: "phourus",
      org_id: 0,
      search: "",
      page: 0,
      limit: 10,
      types: "blogs;events;subjects;questions;answers;debates;bills;votes;beliefs;timeline;quotes"
    }
  });
  return new mSettings();
});
