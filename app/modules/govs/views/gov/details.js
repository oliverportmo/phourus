define(['jquery', 'underscore', 'backbone', '../../../widgets/views/widget'], function($, _, Backbone, vWidget){
	var vDetails= Backbone.View.extend({
		el: '#gov-details',
		tagName: 'div',
		
		initialize: function(){
			_.bindAll(this);
			this.render();
		},
		
		widgets: {
			map: {
				size: 'medium',
				title: 'Maps',
				views: ['map', 'yelp', 'neighborhoods', 'zip']
			},
			regions: {
				size: 'small',
				title: 'Regions',
				views: ['regions']
			}, 
			stats: {
				size: 'medium', 
				title: 'Climate & Demographics',
				views: ['climate', 'demographics']
			},
			websites: {
				size: 'small',
				title: 'Websites',
				views: ['websites']
			},
			calendar: {
				size: 'large',
				title: 'Event Calendar',
				views: ['calendar']
			}
		},
		
		widgetize: function(){
			var self= this; 
			var widgets= {};
			_.each(this.widgets, function(widget, name){
				widget.name= name;
				widgets[name]= new vWidget(widget);
				var html= widgets[name].$el.html();
				$(self.el).append(html);	
			});
			return widgets;			
		},
		
		render: function(){
			this.widgetize();
		}
	});
	return vDetails;
});