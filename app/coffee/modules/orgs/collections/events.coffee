define ["jquery", "underscore", "backbone", "js/models/session", "js/models/settings"], ($, _, Backbone, mSession, mSettings) ->
  collection = Backbone.Collection.extend(
    
    url: ->
      url = "/rest/stream/?debug=false&sort=influence&direction=DESC&type=stream&page=0&limit=10&types=blogs;"
      url

    query: ->
      string = "?debug=false&sort=influence&direction=DESC&type=stream&page=0&limit=10&type=blogs;"
      string
      
    idAttribute: "id"
  )
  raw = () ->
    date = new Date
    d = date.getDate()
    m = date.getMonth()
    y = date.getFullYear()
      
    out = [{
  			title: 'All Day Event',
  			start: new Date(y, m, 1)
  		},
  		{
  			title: 'Long Event',
  			start: new Date(y, m, d-5),
  			end: new Date(y, m, d-2)
  		},
  		{
  			id: 999,
  			title: 'Repeating Event',
  			start: new Date(y, m, d-3, 16, 0),
  			allDay: false
  		},
  		{
  			id: 999,
  			title: 'Repeating Event',
  			start: new Date(y, m, d+4, 16, 0),
  			allDay: false
  		},
  		{
  			title: 'Meeting',
  			start: new Date(y, m, d, 10, 30),
  			allDay: false
  		},
  		{
  			title: 'Lunch',
  			start: new Date(y, m, d, 12, 0),
  			end: new Date(y, m, d, 14, 0),
  			allDay: false
  		},
  		{
  			title: 'Birthday Party',
  			start: new Date(y, m, d+1, 19, 0),
  			end: new Date(y, m, d+1, 22, 30),
  			allDay: false
  		},
  		{
  			title: 'Click for Google',
  			start: new Date(y, m, 28),
  			end: new Date(y, m, 29),
  			url: 'http://google.com/'
  		}
    ]
    
  raw()

