define ["jquery", "underscore", "backbone", "text!html/stream/single/heading.html"], ($, _, Backbone, template) ->
  view = Backbone.View.extend(render: ->
    data = @model.toJSON()
    
    events: 
      "click #plus": "thumbs"
      "click #minus": "thumbs"
    
    thumbs: (e) ->
      id = e.currentTarget.id
      console.log id 
      
    compiled = _.template(template, {meta: data.meta, post: data.post, user: data.user, element: data.element, pic: @pic})
    @$el.html compiled
    compiled
  )
  view
