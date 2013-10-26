define ["jquery", "underscore", "backbone", "text!html/stream/post.html"], ($, _, Backbone, template) ->
  iPost = Backbone.View.extend(
    el: ".post"
    tagName: "div"
    initialize: ->
      @render()

    render: ->
      data = {}
      compiled = _.template(template,
        data: data
      )
      @$el.html compiled
      compiled
  )
  iPost
