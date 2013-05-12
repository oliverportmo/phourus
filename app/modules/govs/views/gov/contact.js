define(['jquery', 'underscore', 'backbone', '../../../widgets/views/widget'], function($, _, Backbone, vWidget){
	var vContact= Backbone.View.extend({
		el: '#gov-contact',
		tagName: 'div',
		
		initialize: function(){
			_.bindAll(this);
			this.render();
		},
		
		widgets: {
			contact: {
				size: 'medium',
				title: 'Contact Information',
				views: ['contact']
			},
			emergency: {
				size: 'small', 
				title: 'Emergency Information',
				views: ['emergency']
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
	return vContact;
});