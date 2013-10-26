define ["jquery", "underscore", "backbone", "forms", "text!html/standard/profile.html", "js/views/sidebar", "js/modules/standard/models/profile"], ($, _, Backbone, forms, template, vSidebar, mProfile) ->
  view = Backbone.View.extend(

    className: "profile"
    
    initialize: (options) ->
    
    render: () ->
      self = @
      @model = new mProfile({id: @options.user})
      @model.fetch
        success: () ->
          self.display()
        error: (error, response) ->
          Backbone.Events.trigger {response: response, location: "modules/standard/views/profile", action: "read", type: "error"}

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
      console.log data
      totals = {blogs: 6, links: 14, ideas: 1, checklist: '', calculator: '', matters: 3, subjects: 11, questions: 5, answers: 7, debates: 21, bills: 6, votes: 22, beliefs: 4, timeline: 2, quotes: 10}
      compiled = _.template(template, {user: data, pic: @pic, totals: totals})
      @$el.html compiled
      
      schema =
        "website": "Text"
        "email": "Text"
        "phone": "Text"
        
      form = new Backbone.Form({model: @model, schema: schema})
      form.render()
      
      container = @$el.find("#fields")
      container.append form.el

      Backbone.Events.trigger "sidebar", "profile"
      compiled
  )
  view
