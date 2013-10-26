define ["jquery", "backbone", "underscore", "js/collections/widgets"], ($, Backbone, _, cWidgets) ->
  
  view = Backbone.View.extend(
  	
  	### CLEAR ###
  	clear: () ->
      $(@el).empty()
  	
  	### SUBVIEWS ###
  	subviews: (selector, view) ->
      selectors = undefined
      if _.isObject(selector)
        selectors = selector
      else
        selectors = {}
        selectors[selector] = view
      return  unless selectors
      _.each selectors, ((view, selector) ->
        view.setElement(@$(selector)).render()
      ), this
    
    ### PAGES ###
    page: (params) ->
      params.el = "#widgets"
      page= params.page
      self = @
          
      if @extra(page) is true
        module = 'govs'
        require ["js/modules/orgs/extras/" + module + "/" + page], (view) ->
          v =  new view(params)
            
      else
        posts = ['checklist', 'calculator', 'matters', 'subjects', 'questions', 'answers', 'debates', 'bills', 'votes', 'beliefs', 'quotes', 'timeline']
        users = ['employees', 'executives', 'teachers', 'students', 'citizens', 'reps', 'leaders', 'members']
        
        page = 'posts' if page in posts
        page = 'users' if page in users
        
        require ["js/modules/orgs/shared/" + page], (view) ->
          v = new view(params)

      page
      
    extra: (page) ->
      module = 'gov'
      extras = cWidgets[module]
      if page in extras
        return true
      else
        return false 
    
    pic: (type, id, ext) ->
      return '/assets/pics/' + type + '/' + id + '.' + ext;
  )
  view