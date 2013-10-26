define ["jquery", "backbone", "underscore"], ($, Backbone, _) ->
  collection = Backbone.Collection.extend(
  
    serialize: (obj) ->
      str = []
      for p of obj
         str.push encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]);
      return str.join "&"

  )
  collection