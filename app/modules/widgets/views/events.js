define(['jquery', 'underscore', 'backbone', 'text!../templates/events.html'], function($, _, Backbone, template){
	var widget= Backbone.View.extend({
		//el: '#view-events',
		tagName: 'div',
		
		initialize: function(){
			this.render();	
		},
		
		render: function(){
			var data= {};
			var compiled= _.template(template, data);
			this.$el.html(compiled);
			return compiled;
		},
	});
	return widget;
});