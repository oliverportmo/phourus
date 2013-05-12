define(['jquery', 'underscore', 'backbone', '../../../widgets/views/widget'], function($, _, Backbone, vWidget){
	var vMore= Backbone.View.extend({
		el: '#gov-more',
		tagName: 'div',
		
		initialize: function(){
			_.bindAll(this);
			this.render();
		},
		
		widgets: {
			organization: {
				size: 'large',
				title: 'Org Chart',
				views: ['org']
			},
			financial: {
				size: 'medium', 
				title: 'Financial & Budget',
				views: ['financial', 'budget']
			},
			rfq: {
				size: 'small',
				title: 'RFQs & RFPs',
				views: ['rfq']
			},
			projects: {
				size: 'medium',
				title: 'Community Projects',
				views: ['users', 'reps']
			},
			reviews: {
				size: 'small',
				title: 'Resident Reviews',
				views: ['reviews']
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
	return vMore;
});