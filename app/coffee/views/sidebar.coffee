define ["jquery", "underscore", "backbone", "text!html/sidebar.html", "text!html/stream/sidebar-form.html", "js/models/types"], ($, _, Backbone, template, sidebarForm, mTypes) ->
  vSidebar = Backbone.View.extend(
    el: "#sidebar"
    initialize: (options) ->   
      self = @
      
      Backbone.Events.on "sidebar", (params) ->
        if(_.isObject(params))
          self.type = params.type
          self.params = params
        else
          self.type = params
        self.render()
      window.onhashchange = ()-> 
        #self.hide()
        #self.render()
     
    hide: ->
      #@$el.animate({left: "-220"}, 500)
      #$("div#content").animate({left: "20"}, 500)
      @$el.hide()
    
    show: ->
      #@$el.animate({left: "0"}, 500)
      #$("div#content").animate({left: "220"}, 500)
      @$el.show()
        
    render: ->   
      self = @
      html = ''   
      
      self.sidebar.clear() unless _.isUndefined(self.sidebar)
      
      @show()
      if @type is '' or _.isUndefined(@type) or @type is 'hidden'
        @hide()  
      else if @type is 'form'         
        require ["js/views/sidebar/form"], (view) ->
          self.sidebar = new view({type: self.post})  
      else if @type is 'orgs'         
        require ["js/views/sidebar/orgs"], (view) ->
          self.sidebar = new view(self.params)  
      else 
        require ["js/views/sidebar/" + @type], (view) ->
          self.sidebar = new view()  
      @type = ''
      
                      
  )
  vSidebar
