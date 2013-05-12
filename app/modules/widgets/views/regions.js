define(['jquery', 'underscore', 'backbone', 'text!../templates/regions.html'], function($, _, Backbone, template){
	var widget= Backbone.View.extend({
		el: '#view-regions',
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