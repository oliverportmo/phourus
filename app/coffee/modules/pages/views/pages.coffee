define (require) ->
$= require("jquery")
_= require("underscore")
Backbone= require("backbone")
template= require("text!html/standard/standard.html")

view = Backbone.View.extend(
  initialize: ->
    @render()

  render: ->
    data = {}
    compiled = _.template(template, data)
    @$el.html compiled
    compiled
)
view