define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->

	model = Backbone.Model.extend(
		
		initialize: (options) ->
      @options= options
      
    url: ->
      url = "/rest/states/?" + @serialize(@options)
      url
      
    idAttribute: "id"
	  	  	  	    	
	)
	model