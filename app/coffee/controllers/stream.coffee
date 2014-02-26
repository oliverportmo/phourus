define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  
  stream =
    stream: ->
      self = @
      params = mode: "stream"
      require ["js/modules/stream/views/stream"], (view) ->
        self.toss view, params


    post: (id) ->
      self = @
      params = id: id
      require ["js/modules/stream/views/post"], (view) ->
        self.toss view, params


    add: (type) ->
      self = @
      params =
        mode: "add"
        type: type

      require ["js/modules/stream/views/form"], (view) ->
        self.toss view, params

    edit: (id) ->
      self = @
      params =
        mode: "edit"
        id: id

      require ["js/modules/stream/views/form"], (view) ->
        self.toss view, params
    
    ### NEED TO EXTEND APPROUTER ###  
    toss: (view, params) ->
      data =
        view: view
        params: params
        id: "orgs"

      Backbone.Events.trigger "module", data, @  