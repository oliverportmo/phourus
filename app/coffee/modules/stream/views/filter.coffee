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
      "click div.types input": "toggle"
    
    toggle: (e) ->
      target = e.currentTarget.id
      types = ""
      $("div.types input:checked").each (index, value) ->
        id = $(this).attr("id")
        types += id + ";"
        
      console.log types
      types = types.slice(0, types.length - 1)
      mSettings.set "types", types

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
