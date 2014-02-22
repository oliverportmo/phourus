define ["jquery", "underscore", "backbone", "forms", "text!html/standard/user.html", "text!html/headings/user.html", "js/views/sidebar", "js/modules/standard/models/user", "js/models/address", "js/models/session", "js/models/types", "js/models/password", "text!html/404/user.html"], ($, _, Backbone, forms, template, tHeading, vSidebar, mUser, mAddress, mSession, mTypes, mPassword, user404) ->
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
      owner = data.id is mSession.get("user_id")
      console.log owner
      console.log data
      params = {user: data.user, pic: @pic, owner: owner, stats: data.stats, address: data.address[0]}
      compiled = _.template(template, params)
      $(@el).html compiled
      
      heading = _.template(tHeading, params)
      $(".heading").html heading
      
      # Models
      @user = new mUser(@model.get('user'))   
      @address = new mAddress(@model.get('address')[0])
      @pass = new mPassword()
      
      # Schemas
      basic_schema = mTypes.schema('user_basic')
      detail_schema = mTypes.schema('user_detail')
      address_schema = mTypes.schema('address')
      password_schema = mTypes.schema('password')
        
      # Forms  
      @basic_form = new Backbone.Form({model: @user, schema: basic_schema})
      @detail_form = new Backbone.Form({model: @user, schema: detail_schema})
      @address_form = new Backbone.Form({model: @address, schema: address_schema})
      @password_form = new Backbone.Form({model: @pass, schema: password_schema})
      
      # Render
      @basic_form.render()
      @detail_form.render()
      @address_form.render()
      @password_form.render()
      
      # Append
      @$el.find("#user_basic").append @basic_form.el   
      @$el.find("#user_detail").append @detail_form.el       
      @$el.find("#user_address").append @address_form.el
      @$el.find("#user_password").append @password_form.el
      
      compiled
    
    save: (e) ->
      self = @
      id = e.currentTarget.id
      if id is 'save_address'
        @address_form.commit()
        model = @address_form.model.changed
        @update_address(model)
      if id is 'save_basic' 
        @basic_form.commit()
        model = @basic_form.model.changed
        @update_user(model)
      if id is 'save_detail'
        @detail_form.commit()
        model = @detail_form.model.changed
        @update_user(model)
      if id is 'save_password'
        @password_form.commit()
        model = @password_form.model.changed
        @update_password(model)
     
     update_user: (model) ->   
        self = @
        $("#mask").show()
        model.id = @user.get('id')  
        @user.save model,
          success: (model, response) ->
              $("#mask").hide()
              Backbone.Events.trigger "alert", {type: "complete", message: "User information saved successfully", response: response, location: "modules/standard/views/user", action: "update"}
              self.render()
          error: (model, response) ->
  	         $("#mask").hide()
  	         if response.status is 404
  	           self.$el.html _.template(user404, {})
  	         else 
  	           Backbone.Events.trigger "alert", {type: "error", message: "User information could not be updated", response: response, location: "modules/standard/views/user", action: "update"}
  	           self.render()
  	   
  	   update_address: (model) ->
  	     self = @
  	     $("#mask").show()
  	     console.log model
  	     @address.save model, 
          success: (model, response) ->
              $("#mask").hide()
              Backbone.Events.trigger "alert", {type: "complete", message: "Address information saved successfully", response: response, location: "modules/standard/views/user", action: "update"}
              self.render()
          error: (model, response) ->
  	         $("#mask").hide()
  	         if response.status is 404
  	           self.$el.html _.template(user404, {})
  	         else 
  	           Backbone.Events.trigger "alert", {type: "error", message: "Address information could not be updated", response: response, location: "modules/standard/views/user", action: "update"}
  	           self.render()
  	     
  	   update_password: (model) ->
  	     self = @
  	     $("#mask").show()
  	     model.id = @user.get('id')
  	     console.log model
  	     pass = new mPassword(model)
  	     pass.save model, 
          success: (model, response) ->
              $("#mask").hide()
              Backbone.Events.trigger "alert", {type: "complete", message: "Password changed successfully", response: response, location: "modules/standard/views/user", action: "update"}
              self.render()
          error: (model, response) ->
  	         $("#mask").hide()
  	         if response.status is 404
  	           self.$el.html _.template(user404, {})
  	         else if response.status is 403
  	           Backbone.Events.trigger "alert", {type: "error", message: "Password could not be changed, current password incorrect", response: response, location: "modules/standard/views/user", action: "update"}
  	         else 
  	           Backbone.Events.trigger "alert", {type: "error", message: "Password could not be changed", response: response, location: "modules/standard/views/user", action: "update"}
  	           self.render()

  	       	     
  )
  view
  
    
  
###
<h3>User's Statistics</h3>
<ul id="stats" class="tabs">
	<li><a href="javascript:void(0)" id="earth" class="selected">Earth</a></li>
	<li><a href="javascript:void(0)" id="mind">Mind</a></li>
	<li><a href="javascript:void(0)" id="voice">Voice</a></li>
	<li><a href="javascript:void(0)" id="self">Self</a></li>
  <li><a href="javascript:void(0)" id="social" >Social</a></li>
</ul>
<div style="background-color: #fff">
	<table id="view_earth" class="view" style="display: table;">
		<colgroup><col class="sidebar-form"><col width="200"><col></colgroup>
		<tbody>
			<tr><td>Blogs:</td><td><%= totals.blogs %></td><td>The current profile's Blog count</td></tr>
			<tr><td>Events:</td><td><%= totals.ideas %></td><td>The current profile's Ideas count</td></tr>
		</tbody>
	</table>
		
	<table id="view_mind" class="view" style="display: none;">
		<colgroup><col class="sidebar-form"><col width="200"><col></colgroup>
		<tbody>
			<tr><td>Subjects:</td><td><%= totals.subjects %></td><td>The current profile's Subject count</td></tr>
			<tr><td>Questions:</td><td><%= totals.questions %></td><td>The current profile's Scores</td></tr>
			<tr><td>Answers:</td><td><%= totals.answers %></td><td>The current profile's Course count</td></tr>
		</tbody>
	</table>
	
	<table id="view_voice" class="view" style="display: none;">
		<colgroup><col class="sidebar-form"><col width="200"><col></colgroup>
		<tbody>
			<tr><td>Debates:</td><td><%= totals.debates %></td><td>The current profile's Discussion count</td></tr>
			<tr><td>Bills:</td><td><%= totals.bills %></td><td>The current profile's Debate count</td></tr>
			<tr><td>Votes:</td><td><%= totals.votes %></td><td>The current profile's Representative count</td></tr>
		</tbody>
	</table>
	
	<table id="view_self" class="view" style="display: none;">
		<colgroup><col class="sidebar-form"><col width="200"><col></colgroup>
		<tbody>
			<tr><td>Beliefs:</td><td><%= totals.beliefs %></td><td>The current profile's Rank summary</td></tr>
			<tr><td>Timeline:</td><td><%= totals.timeline %></td><td>The current profile's Beliefs count</td></tr>
			<tr><td>Quotes:</td><td><%= totals.quotes %></td><td>The current profile's Timeline Event count</td></tr>
        </tbody>
  </table>
    
  <table id="view_social" class="view" style="display: none;">
		<colgroup><col class="sidebar-form"><col width="200"><col></colgroup>
		<tbody>
			<tr><td>Comments:</td><td>247</td><td>The current profile's Checklist summary</td></tr>
			<tr><td>Thumbs:</td><td>431+/142-</td><td>The current profile's Calculator grade</td></tr>
			<tr><td>Views:</td><td>3,451</td><td>The current profile's Endorsement count</td></tr>
		</tbody>
	</table>
</div>
<br clear="all"><br />
###
