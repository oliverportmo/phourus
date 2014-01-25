define ["jquery", "backbone", "underscore", "js/collections/widgets"], ($, Backbone, _, cWidgets) ->
  
  view = Backbone.View.extend(
  	
  	### CLEAR ###
  	destroy: () ->  
      #@undelegateEvents()
      ###
      @$el.removeData().unbind()
      @remove()
      Backbone.View.prototype.remove.call(this)
      ###
    
    clear: () ->
      $(@el).empty()
    
    format_date: (input, mode) ->
      if input is '0000-00-00 00:00:00' or input is null or input is ''
        return 0
      if mode is 'absolute'
        return input
      if mode is 'relative'
        # If < Day = x Hours ago
        # If < Week Monday at time
        # If < Year March 12th
        # If > Year Monday March 12th, 2012
        now= new Date()
        out= ''
        post= new Date(input)
        
        day= post.getDay()
        date= post.getDate()
        month= post.getMonth() + 1
        year= post.getFullYear()
        
        if month is now.getMonth() + 1 and year is now.getFullYear()
          if date is now.getDate()
            hour= post.getHours()		
            if now.getHours() - hour > 1
              out = now.getHours() - hour + ' hours ago'
            else
              out = now.getMinutes() - post.getMinutes() + ' minutes ago'  
          else if date + 1 is now.getDate()
            out ='Yesterday'
          else if now.getDate() - 7 < date
            out = @day_string post.getDay()
          else
            out = @month_string(month) + ' ' + date
            
        else if year is now.getFullYear()
          out = @month_string(month) + ' ' + date
        
        else
          out = @month_string(month) + ' ' + date + ', ' + year
            
      return out
       
    month_string: (input)->
      input= input.toString()
      months = 
        '1': 'January'
        '2': 'February'
        '3': 'March'
        '4': 'April'
        '5': 'May'
        '6': 'June'
        '7': 'July'
        '8': 'August'
        '9': 'September'
        '10': 'October'
        '11': 'November'
        '12': 'December'
      months[input]
	
    day_string: (input) ->
      input = input.toString()
      days =
        "0": "Sunday"
        "1": "Monday"
        "2": "Tuesday"
        "3": "Wednesday"
        "4": "Thursday"
        "5": "Friday"
        "6": "Saturday"
      days[input]
 
      ###  
format_url: (input) ->

		http = input.search new RegExp(/^http:\/\//i)		
		https= input.search(new RegExp(/^https:\/\//i));
		if !http or !https
			input
		else
		    'http://'+input;
	
	

	add_commas: (nStr, decimals) ->

		decimals = decimals || 2
		nStr += ''
		x = nStr.split('.')
		x1 = x[0]
		x2 = x.length > 1 ? '.' + x[1] : ''
		var rgx = /(\d+)(\d{3})/
		while rgx.test(x1) 
			x1 = x1.replace(rgx, '$1' + ',' + '$2')
		result= x1 + x2
		result;	
	
	decimals: -> (n, decimals) 
		sep = "."
		decimals = decimals || 2 
	
		if typeof n == 'string' 
		  n= parseFloat(n)
		
		n.toLocaleString().split(sep)[0] + sep + n.toFixed(decimals).split(sep)[1];


  	url: ->
  		path= window.location.pathname
  		url= path.split('/')
  		url.shift()
  		url
    ###
        	
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
        posts = ['posts', 'checklist', 'calculator', 'matters', 'subjects', 'questions', 'answers', 'debates', 'bills', 'votes', 'beliefs', 'quotes', 'timeline']
        users = ['users', 'employees', 'executives', 'teachers', 'students', 'citizens', 'reps', 'leaders', 'members']
        
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
      return '/assets/pics/' + type + '/' + id + '.' + ext
    
  )
  view