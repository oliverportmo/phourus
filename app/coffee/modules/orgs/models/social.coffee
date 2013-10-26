define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->

	model = Backbone.Model.extend(
		
		defaults:
	  	id: 1
	  	name: "Phourus LLC"
	  	twitter: ""
	  	facebook: "" 
	  	linkedin: "" 	
	)
	model