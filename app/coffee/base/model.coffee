define ["jquery", "backbone", "js/base/sync", "underscore"], ($, Backbone, sync, _) ->
  model = Backbone.Model.extend({
  
    sync: sync
    
    serialize: (obj) ->
      str = []
      for p of obj
         str.push encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]);
      return str.join "&"
  
  })
  model