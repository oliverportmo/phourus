define ["jquery", "underscore", "backbone", "marionette"], ($, _, Backbone, marionette) ->
  router = Backbone.Marionette.AppRouter.extend(

    initialize: (options) ->
      @bind 'route', @track
 
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
    
    ### NEED TO EXTEND APPROUTER, ORGS DIFFERENT PERHAPS BECAUSE OF appRoutes ###  
    toss: (view, params) ->
      data =
        view: view
        params: params
        id: "orgs"

      Backbone.Events.trigger "module", data, @
  )