###
define ["jquery", "underscore", "backbone", "text!html/widgets/org.html", "goog", "goog!visualization,1,packages:[orgchart]"], ($, _, Backbone, template, parser, goog) ->
  
  raw = [
    [{v:'Mike', f:'Mike<div style="color:red; font-style:italic">President</div>'}, '', 'The President'],
    [{v:'Jim', f:'Jim<div style="color:red; font-style:italic">Vice President</div>'}, 'Mike', 'VP'],
    ['Alice', 'Mike', ''],
    ['Bob', 'Jim', 'Bob Sponge'],
    ['Carol', 'Bob', '']]
    
  widget = Backbone.View.extend(

    initialize: (options) ->
      console.log 'load'
      @render()
     
    drawChart: -> 
      console.log raw
      data = new google.visualization.DataTable()
      data.addColumn 'string', 'Name'
      data.addColumn 'string', 'Manager'
      data.addColumn 'string', 'ToolTip'
      data.addRows raw
      chart = new google.visualization.OrgChart(document.getElementById('org'));
      chart.draw data, {allowHtml:true}
         
    render: ->
      data = {}
      compiled = _.template(template, data)
      $(@el).append compiled
      @drawChart()
      compiled
      
  )
  widget
###