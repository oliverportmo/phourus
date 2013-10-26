define ["jquery", "underscore", "backbone", "text!html/standard/home.html", "js/models/types"], ($, _, Backbone, template, mTypes) ->
  view = Backbone.View.extend(
    className: "home"
    
    events:
      "click .label": "section"
      "click .learn": "learn"
      "click .button-home": "learn"

    learn: (e) ->
      id = e.currentTarget.id
      id = id.split("-")
      id = id[1]
      $("#about-" + id).toggle()
      
    section: (e) ->
      id = $(e.currentTarget).attr("id")
      id = id.split(":")
      $("div#elements").show()
      $("div.info").hide()
      $("div.info#" + id[1]).show()
      $("div.element").hide()
      $("div.element#" + id[0]).show()
      
      ###
      TEMP *
      ###
      $("div.element h2").hide()
      $("div.element ul.tabs").hide()
      $("div.element a#close").hide()

    viewHelpers:
      description: (type) ->
        mTypes.description type

    render: ->
      data = mTypes.toJSON()
      delete data[0]

      _.extend data, @viewHelpers
      html = _.template(template,
        data: data
      )
      @$el.html html
      $("div#elements").hide()
      $("#content").addClass('homepage')
      Backbone.Events.trigger "sidebar", "hidden"
      @el
  )
  view
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