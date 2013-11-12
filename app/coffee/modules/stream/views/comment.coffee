define ["jquery", "underscore", "backbone", "text!html/items/comment.html", "js/models/session"], ($, _, Backbone, template, mSession) ->
  view = Backbone.View.extend(
    
    className: "comment"
    
    initialize: () ->
      _.bindAll @
    
    events: 
      "click .edit": "edit"
      "click .delete": "delete"
      "click .confirm": "confirm"
      "click .save": "save"
      "click .cancel": "cancel"
      
    edit: (e) ->
      id = $(e.currentTarget).data("id")
      $(".item#"+id+" .actions div").hide()
      $(".item#"+id+" .actions div.actions-edit").show()
      $(".item#"+id+" .comment span").hide()
      $(".item#"+id+" .comment textarea").show()
     
    save: (e) ->
      console.log $(e.currentTarget).data("id")  
      
    delete: (e) ->
      id = $(e.currentTarget).data("id")
      $(".item#"+id+" .actions div").hide()
      $(".item#"+id+" .actions div.actions-delete").show()

    confirm: (e) ->
      console.log $(e.currentTarget).data("id")
      
    cancel: (e) ->
      id = $(e.currentTarget).data("id")
      $(".item#"+id+" .actions div").hide()
      $(".item#"+id+" .actions div.actions-admin").show()
      $(".item#"+id+" .comment span").show()
      $(".item#"+id+" .comment textarea").hide()
    
    render: (options) -> 
      self = @
      @model = options.toJSON()
      session = mSession.toJSON()
      owner = (session.user_id is @model.user.user.id)
      
      d = 0
      modified = @format_date @model.comment.modified, 'relative'
      created = @format_date @model.comment.created, 'relative'
      
      if created 
        d = created
        
      if modified
        d = 'Updated: ' + modified
      
      compiled = _.template(template, {comment: @model.comment, session: session, pic: @pic, user: @model.user.user, owner: owner, date: d})
      $(@el).html compiled
      $(".item .actions div").hide()
      $(".item .actions div.actions-admin").show()
      @

  )
  view
