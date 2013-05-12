define(['jquery', 'underscore', 'backbone', '../../../widgets/views/widget'], function($, _, Backbone, vWidget){
	var vBasic= Backbone.View.extend({
		el: '#gov-basic',
		tagName: 'div',
		
		initialize: function(){
			_.bindAll(this);
			this.render();
		},
		
		config: {
			types: {
				size: 'medium',
				title: 'Phourus Voice',
				views: ['debates', 'bills', 'votes']
			},
			social: {
				size: 'small', 
				title: 'Social Media',
				views: ['twitter', 'facebook']
			},
			profiles: {
				size: 'large',
				title: 'Phourus Community',
				views: ['users', 'reps']
			}
		},
		
		widgetize: function(){
			this.widgets= {};
			var self= this; 
			_.each(this.config, function(params, name){
				params.name= name;
				self.widgets[name]= new vWidget(params);
				var html= self.widgets[name].$el.html();
				$(self.el).append(html);	
			});
			return self.widgets;			
		},
		
		render: function(){
			this.widgetize();
		}
	});
	return vBasic;
});