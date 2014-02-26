define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  
  pages =
    slug: "pages"
    path: () -> 
    	"modules/{{@slug}}/"
    pages: () ->
      self = @
      params =
        params: settings

      require ["pages"], (view) ->
        self.toss view, params
    
    page: (path) ->
      self = @
      params =
        path: path
      
      require ["js/modules/pages/views/page"], (view) ->
        self.toss view, params
        
    add: () ->
      self = @
      params =
        mode: "add"

      require ["form"], (view) ->
        self.toss view, params
        
    edit: (id) ->
      self = @
      params =
        id: id
        mode: "edit"

      require ["form"], (view) ->
        self.toss view, params  
    
    ### NEED TO EXTEND APPROUTER ###  
    toss: (view, params) ->
      data =
        view: view
        params: params
        id: "orgs"

      Backbone.Events.trigger "module", data, @      