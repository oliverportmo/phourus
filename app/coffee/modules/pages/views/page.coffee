define (require)->
  $= require("jquery")
  _= require("underscore")
  Backbone= require("backbone")
  md= require("mdown")
  template= require("text!html/pages/page.html")
  #sidebar= require("js/modules/sidebar/pages")
  
  view = Backbone.View.extend(
    
    initialize: (options) ->

    render: ->
      host = window.location.hostname
      parts = host.split '.'
      subdomain = parts[0]
  
      $('body').addClass(subdomain)
      source= "mdown!md/"+subdomain+"/#{@options.path}.md"
      self= this
      Backbone.Events.trigger "sidebar", "pages"
	     
      require [source], (template) ->
        match = template.slice(0, 15)
        if match is html and template.length is length
         compiled = 'Not Found'
        else
         compiled = _.template(template, {})   
        self.$el.html compiled
        compiled
  )
  html = '<!DOCTYPE html>'
  length = 722
  view