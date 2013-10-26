require.config
  baseUrl: "/app"
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
    BaseView: "js/base/view"

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
  vHeader = require("js/views/header")
  vSidebar = require("js/views/sidebar")
  vFooter = require("js/views/footer")
  
  BaseCollection = require("js/base/collection")
  BaseModel = require("js/base/model")
  BaseView = require("js/base/view")
  app = new Backbone.Marionette.Application()
  
  standard = require("js/routers/standard")
  stream = require("js/routers/stream")
  orgs = require("js/routers/orgs")
  pages = require("js/routers/pages")
  
  # Header & Footer
  app.addInitializer (options) ->
    app.header = new vHeader()
    app.sidebar = new vSidebar()
    app.footer = new vFooter()
    1

  # Content
  app.addRegions content: "#content"
  
  # Routers
  app.addInitializer (options) ->
    self = this
    Backbone.Events.on "module", (data) ->
      $("#content").removeClass('homepage') 
      view = data.view
      app.content.show new view(data.params)
    
    Backbone.Events.on "alert", (data) ->
      alert 'alert'
      console.log data
      
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
  
  # Backbone.History
  app.on "initialize:after", (options) ->
    Backbone.history = Backbone.history or new Backbone.History({})
    Backbone.history.start()
    window.onhashchange = ()->
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
  
  # Token
  app.on "initialize:before", (options) ->
    token = "guest"
    unless _.isNull(localStorage.getItem("session"))
      data = $.parseJSON(localStorage.getItem("session"))
      mSession.set data
      if mSession.expired()
        mSession.clear()
        localStorage.removeItem "session"
      else
        token = mSession.get("token")
    
    # ** X-API-KEY **/
    #@token is either 'guest' or valid session token
    Backbone._sync = Backbone.sync
    TokenSync = (method, model, options) ->
      options.headers = options.headers or {}
      _.extend options.headers,
        "x-api-key": token

      Backbone._sync method, model, options

    Backbone.sync = TokenSync
    Backbone.View = BaseView
    Backbone.Model = BaseModel
    Backbone.Collection = BaseCollection

  
  # Start
  app.on "start", (options) ->

  options = {}
  app.start options
  app