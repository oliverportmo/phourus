// Generated by CoffeeScript 1.6.2
define(["jquery", "backbone", "underscore"], function($, Backbone, _) {
  var sync;

  sync = function(method, model, options) {
    options.headers = options.headers || {};
    console.log(method);
    if (method === 'post') {
      options.headers["Content-Type"] = "application/x-www-form-urlencoded";
    }
    return Backbone.sync(method, model, options);
  };
  return sync;
});
