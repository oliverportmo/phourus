define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->

	model = Backbone.Model.extend(
		
		initialize: (options) ->
      @options= options
      
    url: ->
      url = "/rest/stats/?post_id=" + @options.post_id + "&type" + @options.type;
      url
      
    idAttribute: "id"
	  	  	  	    	
	)
	model