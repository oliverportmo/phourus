define ["jquery", "underscore", "backbone", "js/models/types"], ($, _, Backbone, mTypes) ->
  vSidebar = Backbone.View.extend(
    el: "#sidebar"
    
    initialize: (options) ->   
      self = @
      @subdomain = options.subdomain
         
      Backbone.Events.on "sidebar", (params) ->
        if(_.isObject(params))
          self.type = params.type
          self.params = params
        else
          self.type = params
          self.params = {}
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
      
      #self.sidebar.destroy() unless _.isUndefined(self.sidebar)
      self.sidebar.clear() unless _.isUndefined(self.sidebar)
      @show()
      
      if @subdomain in @subdomains 
        require ["js/modules/sidebar/subdomains/" + @subdomain], (view) ->
          self.sidebar = new view()
      else if @type is '' or _.isUndefined(@type) or @type is 'hidden'
        @hide()  
      else if @type is 'form'         
        require ["js/modules/sidebar/form"], (view) ->
          self.sidebar = new view({type: self.post})    
      else 
        require ["js/modules/sidebar/" + @type], (view) ->
          self.sidebar = new view(self.params.params)  
      @type = ''
    
    subdomains: ["docs", "wiki", "internal", "agency"]                  
  )
  vSidebar
