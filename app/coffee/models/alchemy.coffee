define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->

	model = Backbone.Model.extend(
		initialize (options) ->
			@options= options
		
		url () ->
			switch @options.api
				when 'concepts' then api= 'GetRankedConcepts'	
				when 'concept' then api= 'GetRankedConcepts'				
				when 'entities' then api= 'GetRankedNamedEntities'
				when 'keywords' then api= 'GetRankedKeywords'
				when 'language' then api= 'GetLanguage'
				when 'relations' then api= 'GetRelations'
				when 'sentiment' then	
				when 'category' then api= 'GetCategory'
				when 'extraction' then
				# text-only not available
				when 'content' then api= 'GetConstraintQuery'	
				when 'author' then api= 'GetAuthor'
				# microformats/rss/atom also available 
				
			# modes are: URL, HTML, Text
			base= 'http://access.alchemyapi.com'
			path= '/calls/'+strtolower(@options.mode)+'/'+@options.mode+api
			base + path
	)
	model