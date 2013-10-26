define (require) ->
  $= require("jquery")
  _= require("underscore")
  Backbone= require("Backbone")
					
  model = Backbone.Model.extend(
  	initialize: (options) ->
     
  	url: "/rest/page/"
  )
  model