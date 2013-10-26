// Generated by CoffeeScript 1.6.2
define(["jquery", "underscore", "backbone"], function($, _, Backbone) {
  var model;

  model = Backbone.Model.extend(initialize(function(options) {
    return this.options = options;
  }), url(function() {
    var api, base, path;

    switch (this.options.api) {
      case 'concepts':
        api = 'GetRankedConcepts';
        break;
      case 'concept':
        api = 'GetRankedConcepts';
        break;
      case 'entities':
        api = 'GetRankedNamedEntities';
        break;
      case 'keywords':
        api = 'GetRankedKeywords';
        break;
      case 'language':
        api = 'GetLanguage';
        break;
      case 'relations':
        api = 'GetRelations';
        break;
      case 'sentiment':
        break;
      case 'category':
        api = 'GetCategory';
        break;
      case 'extraction':
        break;
      case 'content':
        api = 'GetConstraintQuery';
        break;
      case 'author':
        api = 'GetAuthor';
    }
    base = 'http://access.alchemyapi.com';
    path = '/calls/' + strtolower(this.options.mode) + '/' + this.options.mode + api;
    return base + path;
  }));
  return model;
});
