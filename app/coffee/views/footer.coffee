define ["jquery", "underscore", "backbone", "text!html/footer.html", "js/views/login"], ($, _, Backbone, template, vLogin) ->
  view = Backbone.View.extend(
    el: "#footer"
    tagName: "footer"
    
    initialize: ->
      @render()

    render: ->
      data = {}
      compiled = _.template(template, data)
      @$el.html compiled
      
      options = {}
      options.el = "#auth-footer"
      @login = new vLogin(options)
      compiled
  )
  view