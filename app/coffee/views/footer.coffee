define ["jquery", "underscore", "backbone", "text!html/footer.html"], ($, _, Backbone, template) ->
  view = Backbone.View.extend(
    el: "#footer"
    tagName: "footer"
    initialize: ->
      @render()

    render: ->
      data = {}
      compiled = _.template(template, data)
      @$el.html compiled
      compiled
  )
  view