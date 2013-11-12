define ["jquery", "underscore", "backbone", "forms", "text!html/stream/form.html", "text!html/headings/post.html", "text!html/headings/user.html", "js/modules/stream/models/post", "js/models/types", "js/models/session"], ($, _, Backbone, forms, tForm, tPostHeading, tUserHeading, mPost, mTypes, mSession) ->
  view = Backbone.View.extend(
    className: "form"
    
    initialize: (options) ->
      # mode, type, id
      @options= options  
      @model = new mPost(options)   

    events: 
      "click .back": "back"
      "click #create": "create"
      "click #update": "update"
      "click #delete": "delete"
            
    render: ->
      self = @
      Backbone.Events.trigger "sidebar", "form"
      if _.isUndefined(mSession.get("user_id"))
        @$el.html '<h2 style="text-align: center">You must log in to create or modify posts.</h2>'
        return
      if @options.mode is "add"
        @model.clear()
        @display "add"
      if @options.mode is "edit"
        @model.fetch
          success: (model, response) ->
            owner = model.get("meta").user_id
            if !_.isUndefined(mSession.get("user_id")) and owner is mSession.get("user_id") 
              self.options.type = model.get("meta").type
              self.display "edit"    
            else 
              self.$el.html '<h2 style="text-align: center">You are not authorized to modify this post</h2>'
  
          error: (model, response) ->
            if response.status is 404
              self.$el.html '<h2 style="text-align: center">Post could not be found</h2>'
              Backbone.Events.trigger "alert", {type: "message", message: "Post could not be found", response: response, location: "modules/stream/views/form", action: "edit"}
            if response.status is 503
              Backbone.Events.trigger "alert", {type: "error", message: "Post could not be loaded for editing", response: response, location: "modules/stream/views/form", action: "edit"}
      @      
    
    # Display  
    display: (mode) ->
      @options.description = mTypes.description @options.type
      @options.action = "Add"
      if @options.mode is "edit"
        @options.action = "Edit"
        @options.title = @options.type
      if @options.mode is "add"
        @options.title = @options.type.slice(0, @options.type.length - 1)
        @options.title = "Timeline" if @options.type is "timeline"
      compiled = _.template(tForm, {data: @options})
      $(@el).html compiled
      @heading()
      @el

    # Heading
    heading: ->              
      if @options.mode is 'add'   
        user = mSession.get("user")
        params = {user: user, pic: @pic, format_date: @format_date, owner: true}
        t = tUserHeading
      if @options.mode is 'edit'
        data = @model.toJSON()
        owner = (data.meta.user_id is mSession.get("user_id")) 
        type = data.meta.type
        element = mTypes.get_parent(type)
        params = {address: data.user.address[0], meta: data.meta, post: data.post, stats: data.stats, element: element, user: data.user.user, owner: owner, pic: @pic, format_date: @format_date}
        t = tPostHeading
        
      heading = _.template(t, params)  
      $("div.heading").append heading
      @form()
    
    # Form      
    form: () ->
      return if _.isUndefined(@options.type)
      m = @model.get("post") || {}
      m.type = @options.type
      m.id = m.post_id
      if _.isUndefined(m.user_id)
        m.user_id = mSession.get("user_id")
      if m.user_id is not mSession.get("user_id")
        @$el.html '<h2 style="text-align: center">You are not the owner of this post.</h2>'
        return
      @model = new mPost(m)
      schema = mTypes.schema(@options.type)
      console.log schema
      _.extend @model, {schema: schema}

      @form = new Backbone.Form({schema: schema, model: @model})
      @form.render()
      
      container = @$el.find("#fields")
      container.append @form.el
    
    # Back
    back: ->
      Backbone.Events.trigger "back", {}
      
    # Create 
    create: (e) ->
      @form.commit()
      @model.save {},
        success: (model, response) ->
            Backbone.Events.trigger "alert", {type: "complete", message: "Post created successfully", response: response, location: "modules/stream/views/form", action: "create"}
        error: (model, response) ->
	          Backbone.Events.trigger "alert", {type: "error", message: "Post could not be created", response: response, location: "modules/stream/views/form", action: "create"}
	  
	  # Update       
    update: (e) ->
      @form.commit()
      @model.save @model.changed, 
        success: (model, response) ->
            Backbone.Events.trigger "alert", {type: "complete", message: "Post saved successfully", response: response, location: "modules/stream/views/form", action: "update"}
        error: (model, response) ->
	          Backbone.Events.trigger "alert", {type: "error", message: "Post could not be updated", response: response, location: "modules/stream/views/form", action: "update"}
    
    # Delete
    delete: (e) ->
      @model.destroy
        success: (model, response) ->
          Backbone.Events.trigger "alert", {type: "complete", message: "Post deleted successfully", response: response, location: "modules/stream/views/form", action: "delete"}
        error: (model, response) ->
          Backbone.Events.trigger "alert", {type: "error", message: "Post could not be deleted", response: response, location: "modules/stream/views/form", action: "delete"}
    

  )
  view
