define ["jquery", "backbone", "underscore"], ($, Backbone, _) ->
  
  sync = (method, model, options) ->
    options.headers = options.headers or {}
    
    console.log method  
    if method is 'post'
      options.headers["Content-Type"]= "application/x-www-form-urlencoded" 
    
    Backbone.sync method, model, options
  sync