define (require)->
  $= require("jquery")
  _= require("underscore")
  Backbone= require("backbone")
  md= require("mdown")
  template= require("text!html/pages/page.html")
  t404= require("text!html/404/general.html")
  mPage= require("js/modules/pages/models/page")
  
  view = Backbone.View.extend(
    
    initialize: (options) ->
      #console.log options.path
      
    render: ->
      self= @
      
      host = window.location.hostname
      parts = host.split '.'
      subdomain = parts[0]
  
      $('body').addClass(subdomain)
      source= "mdown!md/"+subdomain+"/#{@options.path}.md"
      
      Backbone.Events.trigger "sidebar", "pages"
      self.db()
    
    db: (subdomain) ->
      self = @
      $("#mask").show()
      @page = new mPage({subdomain: subdomain, path: @options.path})
      @page.fetch
        success: (model, response) ->
          $("#mask").hide()
          #if !_.isUndefined(response.template)
            #template = get_template response.template
          self.$el.html _.template(template, response)
        error: (model, response) ->
          $("#mask").hide()
          if response.status is 404
            self.$el.html _.template(t404, {auth: false})
          else 
            Backbone.Events.trigger "alert", {type: "error", message: "Profile could not be loaded", response: response, location: "modules/standard/views/profile", action: "read"}
    
  )
  view