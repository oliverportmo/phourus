require.config({
  baseUrl: "/app"
  paths: 
    init: "js/init"
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
    markdownConverter: 'lib/converter'
    calendar: "lib/calendar"
    analytics: "js/models/analytics"
    #livereload: "js/models/livereload"
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
})
require(["init"], (init) -> 

)