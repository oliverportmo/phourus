define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  
  internal = 
    contacts: (page) ->
      self = @
      params = {}
      require ["js/modules/internal/views/contacts/" + page], (view) ->
        view
        self.toss view, params

    finance: (page) ->
      self = @
      params = {}
      require ["js/modules/internal/views/finance/" + page], (view) ->
        view
        self.toss view, params
        
    more: (page) ->
      self = @
      params = {}
      require ["js/modules/internal/views/more/" + page], (view) ->
        view
        self.toss view, params
    
    ### NEED TO EXTEND APPROUTER ###  
    toss: (view, params) ->
      data =
        view: view
        params: params
        id: "internal"

      Backbone.Events.trigger "module", data, @