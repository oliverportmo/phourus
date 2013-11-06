define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->

	model = Backbone.Model.extend(
		
		initialize: (options) ->
      @options= options
      
    url: ->
      console.log @options 
      query = "?id=" + @options.id unless _.isUndefined(@options.id)
      url = "/rest/orgs/" + query;
      url
      
    idAttribute: "id"
	  	  	  	    	
	)
	model