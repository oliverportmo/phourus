define(['jquery', 'underscore', 'backbone', 'text!../../templates/contact.html'], function($, a, b, template){
	var vContact= Backbone.View.extend({
		el: '#contact',
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
	return vContact;
});