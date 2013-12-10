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

window.debug = (input) ->
  console.log input

define "init", (require) ->
  $ = require("jquery")
  _ = require("underscore")
  Backbone = require("backbone")
  marionette = require("marionette")
  mSession = require("js/models/session")
  mView = require("js/models/view")
  mHeaders = require("js/models/headers")
  vAlerts = require("js/views/alerts")
  vHeader = require("js/views/header")
  vSidebar = require("js/views/sidebar")
  vFooter = require("js/views/footer")
  
  BaseCollection = require("js/base/collection")
  BaseModel = require("js/base/model")
  BaseView = require("js/base/view")
  BaseRouter = require("js/base/router")
  app = new Backbone.Marionette.Application()
  
  
  # Header & Footer
  app.addInitializer (options) ->
    host = window.location.hostname
    parts = host.split '.'
    subdomain = parts[0]
    options = {subdomain: subdomain}
    
    if subdomain in ['docs', 'wiki', 'agency']
      pages = require("js/routers/pages")
    else if subdomain is 'internal'
      internal = require("js/routers/internal")
    else
      standard = require("js/routers/standard")
      stream = require("js/routers/stream")
      orgs = require("js/routers/orgs")
      pages = require("js/routers/pages")
    
    app.header = new vHeader(options)
    app.sidebar = new vSidebar(options)
    app.footer = new vFooter()
    1
     
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
      ###
      Backbone.sync = (method, model, options) ->
        
        options.headers = options.headers or {}
        _.extend options.headers,
          "x-api-key": data.token
          "from": data.user_id
        
        Backbone._sync method, model, options
      ###
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
  
  # AFTER
  app.on "initialize:after", (options) ->
    # Backbone History
    Backbone.history = Backbone.history or new Backbone.History({})
    Backbone.history.start()
    mSession.local()
    
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
  
  # BEFORE
  app.on "initialize:before", (options) ->
    Backbone.View = BaseView
    Backbone.Model = BaseModel
    Backbone.Collection = BaseCollection
    #Backbone.emulateHTTP = true

  # Start
  app.on "start", (options) ->

  options = {}
  app.start options
  app