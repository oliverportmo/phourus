define ["jquery", "underscore", "backbone", "marionette"], ($, _, Backbone, marionette) ->
  router = Backbone.Marionette.AppRouter.extend(
    controller: controller
    appRoutes:
      "pages": "pages"
      "page/*path": "page"
      #"add": "add"
      #"edit/:id": "edit"
  )
  controller =
    slug: "pages"
    path: () -> 
    	"modules/{{@slug}}/"
    pages: () ->
      self = this
      params =
        params: settings

      require ["pages"], (view) ->
        self.toss view, params
    
    page: (path) ->
      self = this
      params =
        path: path
      
      console.log params
      require ["js/modules/pages/views/page"], (view) ->
        self.toss view, params
        
    add: () ->
      self = this
      params =
        mode: "add"

      require ["form"], (view) ->
        self.toss view, params
        
    edit: (id) ->
      self = this
      params =
        id: id
        mode: "edit"

      require ["form"], (view) ->
        self.toss view, params        


    toss: (view, params) ->
      data =
        view: view
        params: params

      Backbone.Events.trigger "module", data, this

  new router(controller: controller)
