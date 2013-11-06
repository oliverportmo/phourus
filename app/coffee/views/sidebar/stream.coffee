define ["jquery", "underscore", "backbone", "js/models/types", "js/models/settings", "js/views/sidebar/widgets/recent", "js/views/sidebar/widgets/create"], ($, _, Backbone, mTypes, mSettings, vRecent, vCreate) ->
  vSidebar = Backbone.View.extend(
    el: "#sidebar"
    className: "stream"
    
    initialize: ->
      @render()  
      self = @
      Backbone.history.bind "all", (route, router) ->
        page = window.location.hash
        page = page.replace("!", "")
        page = page.replace("#", "")
        self.open page  if page is "core" or page is "earth" or page is "mind" or page is "voice" or page is "faith"
        self.all()  if page is "stream"

    events:
      "click input.checkbox": "toggle"
      "click h3.collapsible": "accordion"

    toggle: (e) ->
      target = e.currentTarget.id
      types = ""
      $("input.checkbox:checked").each (index, value) ->
        id = $(this).attr("id")
        types += id + ";"
        
      console.log types
      types = types.slice(0, types.length - 1)
      mSettings.set "types", types

    accordion: (e) ->
      target = e.currentTarget.id
      $("table#"+target).toggle()
    
    open: (input) ->
      type = input
      $(".filter").hide()
      $(".filter#" + type).show()
      _.each mTypes.attributes, (type) ->
        element = type.element
        if element is type

        else

    create: (e) ->
      alert 'hey'
      window.location = "#add/blogs"

    all: ->
      $(".filter").show()

    render: ->
      output = ""
      me = this
      keys = _.each(mTypes.attributes, (type) ->
        element = type.element
        filtered = _.omit(type.sections, ["govs", "groups", "schools", "companies"])
        output += "<div id=\"" + element + "\" class=\"filter\">"
        output += "<h3 id=\"" + element + "\" class=\"collapsible\"><a href=\"javascript:void(0)\">" + element + "</a></h3>"
        output += "<table id=\"" + element + "\">"
        output += me.filters(filtered)
        output += "</table>"
        output += "</div>"
      )
      output += "<div id='recent'></div>"
      output += "<div id='create'></div>"
      $(@el).append output
      @subviews "#recent", new vRecent()
      @subviews "#create", new vCreate()
      @el

    filters: (sections) ->
      output = ""
      _.each sections, (name) ->
        name = name.toLowerCase()
        
        #var name= _.keys(i)[0];
        section = "add"
        func = "onclick=\"add('" + name + "')\""
        uri = "add/" + name
        if name is "calculator" or name is "checklist" or name is "budget"
          section = "view"
          func = "onclick=\"edit('" + name + "', 'edit')\""
          uri = name
        if name is "companies" or name is "courses" or name is "reps" or name is "searching"
          section = "search"
          func = "onclick=\"listing('" + name + "')\""
          uri = name
        
        #var icon= '<td><img src="/assets/icons/large/'.$type.'/'.$key.'.png" /></td>';
        action = "<a href=\"#" + uri + "\" id=\"action_" + name + "\" class=\"action\">" + section + "</a></td>"
        title = "<td style=\"width: 180px;padding: 0px;margin: 0px;\"><a href=\"javascript:void(0)\" id=\"" + name + "\" class=\"link\">" + name + "</a> " + "</td>"
        #checkbox = "<td><div id=\"" + name + "\" class=\"checkbox on\"></div></td>"
        checkbox = "<td><input id='" + name + "' type='checkbox' class='checkbox' checked /></td>"
        
        #$action= '<td><a href="javascript:void(0)" '.$function.'><img src="/assets/icons/general/'.$section.'.png" width="24" height="24" /></a></td>';
        output += "<tr id=\"" + name + "\" class=\"toggle\">" + title + checkbox + "</tr>"

      output
  )
  vSidebar
