define ["jquery", "underscore", "backbone", "text!html/standard/signup.html", "js/views/register"], ($, _, Backbone, template, vRegister) ->
  view = Backbone.View.extend(
    
    events:
      "click .register": "register"
      
    render: ->
      data = {}
      Backbone.Events.trigger "sidebar", "general"
      compiled = _.template(template, data)
      @$el.html compiled
      @register = new vRegister()    
      @form = @register.render()  
      
      #$("#fields").append @form.el
      container = @$el.find("#fields")
      container.append @form
      @

    register: (e) ->
      @register.register e      	 

  )
  view
