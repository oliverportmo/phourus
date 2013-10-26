define ["jquery", "underscore", "backbone", "text!html/widgets/influence.html"], ($, _, Backbone, template) ->
  widget = Backbone.View.extend(

    raw: 
      influence: 69
      followers: 1432
      following: 321
      friends: 213
      posts: 31
      influence_posts: 42
      influence_friends: 55
    
    render: ->
      data = @raw
      compiled = _.template(template, data: @raw)
      $(@el).append compiled
      compiled
      
  )
  widget