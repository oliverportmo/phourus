define ["jquery", "underscore", "backbone", "text!html/standard/page.html", "js/modules/standard/models/page"], ($, _, Backbone, template, model) ->
  view = Backbone.View.extend(
    initialize: (options) ->
      self = @
      @model = new model(options.page)
      @model.fetch
        success: ->
          self.render()

        error: ->
          self.render()

    render: ->
      compiled = _.template(template,
        data: @model.toJSON()
      )
      @$el.html compiled
      compiled
  )
  view
