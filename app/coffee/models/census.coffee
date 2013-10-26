define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->

	model = Backbone.Model.extend(
		key: '1af42f7c7dd9677fce0aa420e3f8a051a481c96e'
		initialize (options) ->
			@options= options
		
		url () ->
			@options

	)
	model