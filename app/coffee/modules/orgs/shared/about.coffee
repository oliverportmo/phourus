define ["jquery", "underscore", "backbone", "text!html/orgs/shared/about.html", "js/modules/orgs/models/org", "js/models/stats", "text!html/orgs/about/stats.html"], ($, _, Backbone, template, mOrg, mStats, tStats) ->
  widget = Backbone.View.extend(

    initialize: (options) ->
      @options = options
      self = @
      @model = new mOrg(options)
      @model.fetch
        success: ->
          self.render()

        error: (collection, response) ->
          data= {response: response, location: "modules/orgs/shared/about", action: "read", type: "error"}
          Backbone.Events.trigger "alert", data
      
    render: ->
      data = @options.org 
      compiled = _.template(template, {org: data.org, address: data.address[0], stats: data.stats})
      $(@el).append compiled
      @stats()
      compiled
    
    stats: ->
      self = @
      ###
      model = new mStats({type: 'org', id: 1})
      model.fetch
        success: (model) ->
          ##compiled = _.template(tStats, {stats: model.attributes})
          ##$('div#stats.right').append compiled

        error: (collection, response) ->
          vAlerts.add response, "vAbout", "stats", "error"
      ###
      
      
  )
  widget