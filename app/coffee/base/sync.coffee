define ["jquery", "backbone", "underscore", "js/models/headers"], ($, Backbone, _, mHeaders) ->
  
  _sync = Backbone.sync
  Backbone.sync = (method, model, options) ->
    options.headers = options.headers or {}
    _.extend(options.headers, mHeaders.attributes)
      
    if method is 'create' or method is 'update'
      options.headers["Content-Type"]= "application/x-www-form-urlencoded" 
      options.data = $.param(model.attributes)
    
    _sync method, model, options