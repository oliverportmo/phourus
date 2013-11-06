define ["jquery", "underscore", "backbone", "forms", "text!html/standard/user.html", "text!html/headings/user.html", "js/views/sidebar", "js/modules/standard/models/user", "js/models/session"], ($, _, Backbone, forms, template, tHeading, vSidebar, mUser, mSession) ->
  view = Backbone.View.extend(

    className: "user"
    
    initialize: (options) ->
    
    render: () ->
      self = @
      Backbone.Events.trigger "sidebar", "profile"
      @model = new mUser({id: @options.user})
      @model.fetch
        success: () ->
          self.display()
        error: (error, response) ->
          Backbone.Events.trigger "alert", {type: "error", message: "Profile could not be loaded", response: response, location: "modules/standard/views/profile", action: "read"}

    events: 
      "click ul.tabs a": "tab"
      "click #update_account": "expand"
    
    expand: ->
      if $("#update").is(':hidden') is true
        $("#update").show()
        $("#update_account").html("Hide Profile Information")
      else
        $("#update").hide()
        $("#update_account").html("Edit Profile Information")
      
    tab: (e) ->
      id = e.currentTarget.id
      $(".view").hide()
      $(".view#view_" + id).show()
      $("ul.tabs li a").removeClass('selected')
      $("ul.tabs li a#" + id).addClass('selected')
      
    display: ->
      data = @model.attributes
      totals = {blogs: 6, links: 14, ideas: 1, checklist: '', calculator: '', matters: 3, subjects: 11, questions: 5, answers: 7, debates: 21, bills: 6, votes: 22, beliefs: 4, timeline: 2, quotes: 10}
      owner = data.id is mSession.get("user_id")
      console.log owner
      console.log data
      params = {user: data, pic: @pic, totals: totals, owner: owner}
      compiled = _.template(template, params)
      @$el.html compiled
      
      heading = _.template(tHeading, params)
      $(".heading").html heading
      
      schema =
        "website": "Text"
        "email": "Text"
        "phone": "Text"
        
      form = new Backbone.Form({model: @model, schema: schema})
      form.render()
      
      container = @$el.find("#fields")
      container.append form.el
      
      compiled
  )
  view
