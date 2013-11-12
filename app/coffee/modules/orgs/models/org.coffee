define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->

	model = Backbone.Model.extend(
		
		initialize: (options) ->
      @options= options
      
    url: ->
      query = ''
      if !_.isUndefined(@options)
        query = "?id=" + @options.id unless _.isUndefined(@options.id)
      url = "/rest/org/" + query;
      url
      
    idAttribute: "id"
	  	  	  	    	
	)
	model