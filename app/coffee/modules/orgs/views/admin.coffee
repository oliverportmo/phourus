define ["jquery", "underscore", "backbone", "forms", "text!html/orgs/admin.html", "text!html/orgs/listing-admin.html", "js/modules/orgs/collections/orgs", "js/modules/orgs/models/org", "js/models/session", "js/models/types"], ($, _, Backbone, forms, template, iOrg, cOrgs, mOrg, mSession, mTypes) ->
  view = Backbone.View.extend(
    
    initialize: (options) ->
      @options = options  
 
    events: 
      "click .edit": "edit"
      
    edit: (e) ->
      id = e.currentTarget.id
      @select id
      
    render: () ->
      self = @
      Backbone.Events.trigger "sidebar", "general"       
      @options.user_id = mSession.get("user_id")
      
      @collection = new cOrgs(@options)
      @collection.fetch
        success: (collection, response) ->
          self.display()
        error: (collection, response) ->
          if response.status is 404
            self.$el.html '<h2 style="text-align: center">You are not the administrator of any organizations</h2>'
          if response.status is 503
            Backbone.Events.trigger "alert", {type: "error", message: "Could not load Org admin", response: response, location: "modules/orgs/views/admin", action: "read"}

    display: ->
      compiled = '<h1>Please select an Organization to edit:</h1>
      <div class="list"></div>
      <div class="org"></div>'
      @$el.html compiled
      compiled
      
      self = @
      @select(0)
      i = 0
      $(".list").html ''
      _.each @collection.models, (data, key) ->
        data = data.toJSON()
        o = _.template(iOrg, {id: i, org: data.org, address: data.address[0], stats: data.stats, pic: self.pic})
        $(".list").append o
        i++
    
    select: (id) ->
      $(".org").html ''
      data = @collection.models[id].toJSON()
      @model = new mOrg(data.org)
      requests = []
      owner = true
      compiled = _.template(template, {org: data.org, address: data.address, requests: requests, pic: @pic, owner: owner})
      $(".org").html compiled
      @form()
      compiled
      
    form: ->
      schema = mTypes.schema('orgs')
      _.extend @model, {schema: schema}

      form = new Backbone.Form({schema: schema, model: @model})
      form.render()
      
      container = @$el.find("#fields")
      container.append form.el
  )
  view