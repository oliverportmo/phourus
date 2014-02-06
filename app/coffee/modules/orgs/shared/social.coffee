define ["jquery", "underscore", "backbone", "text!html/orgs/shared/social.html", "js/modules/orgs/models/social"], ($, _, Backbone, template, mSocial) ->
  widget = Backbone.View.extend(

    initialize: (options) ->  
      @model = new mSocial   
      
    render: ->
      data = @model.toJSON()
      compiled = _.template(template, {data: data})
      $(@el).append compiled
      compiled
      
  )
  widget