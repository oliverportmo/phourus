define(['jquery', 'underscore', 'backbone', 'text!../templates/twitter.html'], function($, _, Backbone, template){
	var widget= Backbone.View.extend({
		el: '#view-twitter',
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