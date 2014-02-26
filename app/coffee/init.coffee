require.config
  baseUrl: "/app"
  urlArgs: "bust=" + (new Date()).getTime()
  #waitSeconds: 0
  paths:
    jquery: "lib/jquery"
    underscore: "lib/underscore"
    backbone: "lib/backbone"
    marionette: "lib/marionette"
    text: "lib/text"
    forms: "lib/forms"
    auth: "lib/auth"
    firefly: "lib/firefly"
    async: "lib/async"
    goog: "lib/goog"
    parser: "lib/parser"
    mdown: "lib/mdown"
    markdownConverter : 'lib/converter'
    calendar: "lib/calendar"
    analytics: "js/models/analytics"
    livereload: "js/models/livereload"
    storage: "lib/storage"

  shim:
    backbone:
      deps: ["jquery", "underscore"]
      exports: "Backbone"

    underscore:
      exports: "_"

    forms:
      deps: ["backbone"]
      exports: "forms"

    jquery:
      exports: "$"

    marionette:
      deps: ["jquery", "underscore", "backbone"]
      exports: "Marionette"

define "init", (require) ->
  $ = require("jquery")
  _ = require("underscore")
  Backbone = require("backbone")
  marionette = require("marionette")
  mSession = require("js/models/session")
  mView = require("js/models/view")
  mHeaders = require("js/models/headers") 
  vAlerts = require("js/views/alerts")  
  
  # Still no runtime routers :(
  rStandard = require("js/routers/standard")
  rStream = require("js/routers/stream")
  rOrgs = require("js/routers/orgs")
  rInternal = require("js/routers/internal")
  rPages = require("js/routers/pages")
  
  cStandard = require("js/controllers/standard")
  cStream = require("js/controllers/stream")
  cOrgs = require("js/controllers/orgs")
  cInternal = require("js/controllers/internal")
  cPages = require("js/controllers/pages")
  
  new rPages({controller: cPages})
  new rStandard({controller: cStandard})
  new rStream({controller: cStream})
  new rOrgs({controller: cOrgs})
  new rInternal({controller: cInternal})
  
  vHeader = require("js/views/header")
  vSidebar = require("js/views/sidebar")
  vFooter = require("js/views/footer")
     
  Backbone.Collection = require("js/base/collection")
  Backbone.Model = require("js/base/model")
  Backbone.View = require("js/base/view")
  Backbone.Router = require("js/base/router")
  
  app = new Backbone.Marionette.Application()
  
  # Content
  app.addRegions content: "#content"
  
  # Routers
  app.addInitializer (options) ->
    self = @
    
    # module
    Backbone.Events.on "module", (data) ->
      $("#content").removeClass('homepage') 
      view = data.view
      app.content.show new view(data.params)
    
    # alert
    Backbone.Events.on "alert", (data) ->
      console.log data if data.type is "error"
      vAlerts.add data.type, data.message
    
    # back 
    Backbone.Events.on "back", (data) ->
      window.history.back()
    
    # token
    Backbone.Events.on "token", (data) ->
      mHeaders.set("x-api-key", data.token)
      mHeaders.set("from", data.user_id)

    #map
    Backbone.Events.on "map", (data) ->  
      dev = false
      unless dev is true
        require ["js/models/maps"], (mMap) ->
          gmap = $.find("#gmap").length
          if gmap > 0
            map = new mMap(data)	 
            map.setElement($("#gmap"))
            map.render()
          1
  
  # BEFORE
  app.on "initialize:before", (options) ->
    mSession.local()
    #Backbone.emulateHTTP = true  
  
  # AFTER
  app.on "initialize:after", (options) ->    
    host = window.location.hostname
    parts = host.split '.'
    subdomain = parts[0]
    @subdomain = subdomain
    admin = 0
    
    if subdomain in ['wiki', 'internal'] and admin isnt 1
      alert "You must be an admin to access this page. Please log in with an Admin account if you wish to access this subdomain."
      location.href = "http://www.phourus.local/" 

    options = {subdomain: @subdomain}   
    app.header = new vHeader(options)
    app.sidebar = new vSidebar(options)
    app.footer = new vFooter()
    
    # Backbone History
    Backbone.history = Backbone.history or new Backbone.History({})
    Backbone.history.start()
    
    ### VIEW TRACKING ###
    window.onhashchange = ()->
      $('#alerts').html ''
      ###
      alert('change')
      view= new mView()
      view.save(
        success: ()->
          alert('success')
          
        error: ()->
          alert('fail') 
      )
      ###
  

  # Start
  app.on "start", (options) ->

  options = {}
  app.start options
  app