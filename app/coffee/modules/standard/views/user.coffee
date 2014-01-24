define ["jquery", "underscore", "backbone", "forms", "text!html/standard/user.html", "text!html/headings/user.html", "js/views/sidebar", "js/modules/standard/models/user", "js/models/session", "text!html/404/user.html"], ($, _, Backbone, forms, template, tHeading, vSidebar, mUser, mSession, user404) ->
  view = Backbone.View.extend(

    className: "user"
    
    initialize: (options) ->
      
    render: () ->
      self = @
      Backbone.Events.trigger "sidebar", {type: 'default', params: @options}
      @model = new mUser({id: @options.user})
      $("#mask").show()
      @model.fetch
        success: () ->
          $("#mask").hide()
          self.display()
        error: (error, response) ->
          $("#mask").hide()
          Backbone.Events.trigger "alert", {type: "error", message: "Profile could not be loaded", response: response, location: "modules/standard/views/profile", action: "read"}

    events: 
      "click ul.tabs a": "tab"
      "click #update_account": "expand"
      "click .save": "save"
    
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
      params = {user: data.user, pic: @pic, totals: totals, owner: owner}
      compiled = _.template(template, params)
      $(@el).html compiled
      
      heading = _.template(tHeading, params)
      $(".heading").html heading
      
      schema =
        "website": "Text"
        "email": "Text"
        "phone": "Text"
        
      @form = new Backbone.Form({model: @model, schema: schema})
      @form.render()
      
      container = @$el.find("#fields")
      container.append @form.el
      
      compiled
    
    save: (e) ->
      $("#mask").show()
      @form.commit()
      @model.save @model.changed, 
        success: (model, response) ->
            $("#mask").hide()
            Backbone.Events.trigger "alert", {type: "complete", message: "User information saved successfully", response: response, location: "modules/stream/views/user", action: "update"}
        error: (model, response) ->
	         $("#mask").hide()
	         if response.status is 404
	           self.$el.html _.template(user404, {})
	         else 
	           Backbone.Events.trigger "alert", {type: "error", message: "User information could not be updated", response: response, location: "modules/stream/views/user", action: "update"}
  )
  view
