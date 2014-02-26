define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  
  orgs =
    orgs: (type, query) ->
      self = @
      settings = query unless _.isUndefined(query)
         
      params =
        section: "home"
        type: type
        params: settings
        
      require ["js/modules/orgs/views/home"], (view) ->
        self.toss view, params

    org: (type, id, page) ->
      self = @
      page = "about" if _.isUndefined(page) or page is ""
      params =
        id: id
        type: type
        page: page
      
      require ["js/modules/orgs/views/org"], (view) ->
        self.toss view, params

    signup: ->
      self = @
      params =
        section: "signup"
        params: ""

      require ["js/modules/orgs/views/signup"], (view) ->
        self.toss view, params

    admin: ->
      self = @
      params =
        section: "admin"
        params: ""

      require ["js/modules/orgs/views/admin"], (view) ->
        self.toss view, params