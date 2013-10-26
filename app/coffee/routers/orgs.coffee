define ["jquery", "underscore", "backbone", "marionette"], ($, _, Backbone, marionette, init) ->
  router = Backbone.Marionette.AppRouter.extend(
    controller: controller

    initialize: (options) ->
      @route '!orgs/signup', "orgs", options.controller.signup
      @route '!orgs/admin', "orgs", options.controller.admin
      
      # !{orgs}/:query
      @route /^!(companies|govs|groups|schools)\/(.*?)$/, "orgs", options.controller.orgs
      # !{orgs}
      @route /^!(companies|govs|groups|schools)$/, "orgs", options.controller.orgs
      
      # !{org}/:id
      @route /^!(company|gov|group|school)\/(.*?)$/, "orgs", options.controller.org
      # !{org}/:id/:page
      @route /^!(company|gov|group|school)\/(.*?)\/(.*?)$/, "orgs", options.controller.org
      
      
       
    toss: (view, params) ->
      data =
        view: view
        params: params
        id: "orgs"

      Backbone.Events.trigger "module", data, this
      
  )
  controller =
    orgs: (type, query) ->

      settings = query unless _.isUndefined(query)
      self = this
      
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
      self = this
      params =
        section: "signup"
        params: ""

      require ["js/modules/orgs/views/signup"], (view) ->
        self.toss view, params

    admin: ->
      self = this
      params =
        section: "admin"
        params: ""

      require ["js/modules/orgs/views/admin"], (view) ->
        self.toss view, params

    

  new router(controller: controller)
