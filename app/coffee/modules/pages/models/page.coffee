define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->		
  model = Backbone.Model.extend(     
  	url: "/rest/page/"
  )
  model