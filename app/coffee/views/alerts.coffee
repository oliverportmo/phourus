define ["jquery", "underscore", "backbone", "text!html/alert.html", "js/collections/alerts", "js/models/alert"], ($, _, Backbone, template, cAlerts, mAlert) ->
  vAlerts = Backbone.View.extend(
    el: "#alerts"
    tagName: "div"
    initialize: ->
      @collection = new cAlerts()
      @collection.bind "change", @render, this

    events:
      "click .close": "close"

    close: (e) ->
      id = e.currentTarget.id
      model = _.find(@collection.models, (model) ->
        model.set "hidden", true  if model.cid is id
      )
      $(e.currentTarget).parent().remove()

    add: (type, message, code, debug) ->
      alert = new mAlert(
        type: type
        message: message
        code: code
      )
      @collection.add alert
      
      #debug(debug);
      @render()

    render: ->
      self = @$el
      self.html ""
      _.each @collection.models, (model) ->
        if model.get("hidden") isnt true
          cid = cid: model.cid
          alert = _.template(template, _.extend(model.toJSON(), cid))
          self.append alert

  )
  new vAlerts()
