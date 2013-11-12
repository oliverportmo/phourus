define ["jquery", "underscore", "backbone", "marionette"], ($, _, Backbone, marionette, init) ->
  router = Backbone.Marionette.AppRouter.extend(
    controller: controller
    appRoutes:
      "!stream": "stream"
      "!post/:id": "post"
      "add/:type": "add"
      "edit/:id": "edit"
  )
  controller =
    stream: ->
      self = this
      params = mode: "stream"
      require ["js/modules/stream/views/stream"], (view) ->
        self.toss view, params


    post: (id) ->
      self = this
      params = id: id
      require ["js/modules/stream/views/post"], (view) ->
        self.toss view, params


    add: (type) ->
      self = this
      params =
        mode: "add"
        type: type

      require ["js/modules/stream/views/form"], (view) ->
        self.toss view, params


    edit: (id) ->
      self = this
      params =
        mode: "edit"
        id: id

      require ["js/modules/stream/views/form"], (view) ->
        self.toss view, params


    toss: (view, params) ->
      data =
        view: view
        params: params
        id: "stream"

      Backbone.Events.trigger "module", data, this

  new router(controller: controller)
