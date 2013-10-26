define ["jquery", "underscore", "backbone", "text!html/orgs/heading.html"], ($, _, Backbone, template) ->
  view = Backbone.View.extend(
    
    initialize: (options) ->
      @options = options
      @render()

    render: ->
      data = @options
      compiled = _.template(template, {id: data.id, org: data.org, address: data.address[0], stats: data.stats, pic: @pic})
      @$el.html compiled
      compiled
  )
  view