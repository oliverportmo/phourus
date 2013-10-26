define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->

	model = Backbone.Model.extend(
		defaults:
	  	hidden: false
	)
	model