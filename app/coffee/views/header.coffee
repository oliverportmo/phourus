define ["jquery", "underscore", "backbone", "text!html/header.html", "js/views/login"], ($, _, Backbone, template, vLogin) ->
  view = Backbone.View.extend(
    el: "#header"
    tagName: "header"
    initialize: (options) ->
      @render(options)

    subdomains: ['docs','wiki','internal','agency']
    
    render: (options) ->
      data = {}
      compiled = _.template(template, data)
      @$el.html compiled     
      $('nav').hide()
      
      if options.subdomain in @subdomains
        $('nav#' + options.subdomain).show()
        #$('span#slogan').html(options.subdomain)
      else
        $('nav#www').show()
        #$('span#slogan').html('')      	
      
      options = {}
      options.el = "#auth-header"
      @login = new vLogin(options)
      compiled
  )
  view
