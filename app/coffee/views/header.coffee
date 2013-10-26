define ["jquery", "underscore", "backbone", "text!html/header.html", "js/views/login"], ($, _, Backbone, template, vLogin) ->
  view = Backbone.View.extend(
    el: "#header"
    tagName: "header"
    initialize: ->
      @render()

    render: ->
      data = {}
      compiled = _.template(template, data)
      @$el.html compiled     
      $('nav').hide()
      subdomain= 'www'
      if(subdomain== 'agency')
      	$('nav#agency').show()	
      	$('span#slogan').html('Agency')		
      else if(subdomain== 'wiki')
      	$('nav#wiki').show()
      	$('span#slogan').html('Wiki')	
      else
      	$('nav#www').show()
      
      @login = new vLogin()
      compiled
  )
  view
