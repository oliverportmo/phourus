define ["jquery", "underscore", "backbone", "js/models/session", "js/models/settings"], ($, _, Backbone, mSession, mSettings) ->
  collection = Backbone.Collection.extend(
    
    initialize: (options) ->
      @options = {}
      #@options.id = options.id
      if(!_.isUndefined(options.id))
        @options.id = options.id
      
      if(!_.isUndefined(options.org_id))
        @options.org_id = options.org_id
      
      if(!_.isUndefined(options.mode))
        @options.mode = options.mode
        
      if(!_.isUndefined(options.type))  
        @options.type = options.type
        
    url: ->
      url = "/rest/community/?" + @serialize @options;
      url
    
    idAttribute: "id"
  )
  collection
