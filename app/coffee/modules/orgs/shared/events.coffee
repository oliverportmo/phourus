define ["jquery", "underscore", "backbone", "text!html/orgs/shared/events.html", "js/modules/orgs/collections/events", "calendar"], ($, _, Backbone, template, cEvents, calendar) ->

  widget = Backbone.View.extend(
       
    initialize: (options) ->
      #@collection = new cEvents
      @collection = cEvents
      
    render: ->
      data = {}
      compiled = _.template(template, data)
      $(@el).append compiled

      header = {}
      header.left = 'prev,next today'
      header.center = 'title'
      header.right = 'month,basicWeek,basicDay'
      
      editable = true
      
      #events = @cEvents.toJSON()
      events = cEvents
      console.log events
      $("#calendar").fullCalendar {header: header, editable: true, events: events}
      compiled
  )
  widget