({
    baseUrl: "../app/js",
    name: "init",
    out: "build.js",
    paths: {
      jquery: "../lib/jquery",
      underscore: "../lib/underscore",
      backbone: "../lib/backbone",
      marionette: "../lib/marionette",
      text: "../lib/text",
      forms: "../lib/forms",
      auth: "../lib/auth",
      firefly: "../lib/firefly",
      //require: "../lib/require",
      BaseView: "../js/base/view"
    },
    //include: ['require'],
    //optimization: 'none',
    shim: {
      backbone: {
        deps: ["jquery", "underscore"],
        exports: "Backbone"
      },
      underscore: {
        exports: "_"
      },
      forms: {
        deps: ["backbone"],
        exports: "forms"
      },
      jquery: {
        exports: "$"
      },
      marionette: {
        deps: ["jquery", "underscore", "backbone"],
        exports: "Marionette"
      }
    }

    /*modules: [
        {
            name: "layout"
        },
        {
            name: "lib"
        },
        {
            name: "standard"
        },
        {
            name: "stream"
        },
    ]*/
})
