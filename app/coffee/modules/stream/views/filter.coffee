define ["jquery", "underscore", "backbone", "js/models/settings", "text!html/stream/filter.html"], ($, _, Backbone, mSettings, tFilter) ->
  vFilter = Backbone.View.extend(
    el: "#filter"
    tagName: "div"
    initialize: ->
      @render()

    events:
      "change #sort": "selected"
      "change #direction": "selected"
      "change #type": "create"
      "click ul#mode li a": "mode"

    create: (e) ->
      id = e.currentTarget.id
      value = e.currentTarget.value
      window.location.hash = "#add/" + value

    selected: (e) ->
      id = e.currentTarget.id
      value = e.currentTarget.value
      mSettings.set id, value

    mode: (e) ->
      mode = e.currentTarget.id
      $("ul#mode li a").removeClass "selected"
      $("ul#mode li a#" + mode).addClass "selected"
      mSettings.set "mode", mode

    render: ->
      data = {}
      compiled = _.template(tFilter, data)
      @$el.html compiled
      compiled
  )
  vFilter
