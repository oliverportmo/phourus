define ["jquery", "underscore", "backbone", "text!html/elements.html"], ($, _, Backbone, template) ->
  vElements = Backbone.View.extend(
    el: "#elements"
    tagName: "div"
    initialize: ->
      $("#elements").hide()
      me = this
      Backbone.history.bind "all", (route, router) ->
        page = window.location.hash
        page = page.replace("!", "")
        page = page.replace("#", "")
        me.open page  if page is "core" or page is "earth" or page is "mind" or page is "voice" or page is "self"


    events:
      "click #close": "close"
      hashchange: "open"
      "click ul#sections li a": "select"

    select: (e) ->
      id = e.currentTarget.id
      $(".info").hide()
      $(".info#" + id).show()

    close: ->
      $("#elements").hide()

    open: (element) ->
      $(".info").hide()
      $(".element#" + element + " div.info").first().show()
      $(".element").hide()
      $(".element#" + element).show()
      $("#elements").show()

    render: ->
      data = {}
      compiled = _.template(template, data)
      @$el.html compiled
      compiled
  )
  vElements
