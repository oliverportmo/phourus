define ["jquery", "underscore", "backbone", "text!html/standard/home.html", "js/models/types", "js/views/login", "js/views/register"], ($, _, Backbone, template, mTypes, vLogin, vRegister) ->
  view = Backbone.View.extend(
    className: "home"
    
    initialize: (options) ->
    
    events:
      "click .learn": "learn"
      "click .register": "register"

    learn: (e) ->
      id = e.currentTarget.id
      id = id.split("-")
      id = id[1]
      $(".element").hide()
      $(".element#element-" + id).show()
      
    viewHelpers:
      description: (type) ->
        mTypes.description type

    render: ->
      Backbone.Events.trigger "sidebar", "hidden"
      data = mTypes.toJSON()
      delete data[0]

      _.extend data, @viewHelpers
      html = _.template(template,
        data: data
      )
      $(@el).html html
      $("div#elements").hide()
      $("#content").addClass('homepage') 
      
      options = {}
      @subviews "#auth-home", new vLogin()
      
      options = {}
      options.type = 'short'
      @register = new vRegister(options)    
      @form = @register.render()  
      
      #$("#fields").append @form.el
      container = @$el.find("#fields")
      container.append @form
      
      @
    
    register: (e) ->
      @register.register e  
  )
  view
###
section: (e) ->
  id = $(e.currentTarget).attr("id")
  id = id.split(":")
  $("div#elements").show()
  $("div.info").hide()
  $("div.info#" + id[1]).show()
  $("div.element").hide()
  $("div.element#" + id[0]).show()

  $("div.element h2").hide()
  $("div.element ul.tabs").hide()
  $("div.element a#close").hide()
###
###
<div id="elements" style="display: none">
	<% _.each(data, function(type){ %>
		<% if(!_.isFunction(type)){ %>
			<div id="<%= type.element %>" class="element">
				<h2>Phourus <%= type.element.toUpperCase() %></h2><a href="javascript:void(0)" id="close">X</a>
				<br clear="all">
				<img src="/assets/elements/white/<%= type.element %>.png">
				<% _.each(type.sections, function(value, key, list){ %>
					<div id="<%= key %>" class="info">
						<p><%= data.description(key) %></p>
					</div>
				<% }); %>
				<br clear="all">
			</div>
		<% } %>	
	<% }); %>
</div>
###