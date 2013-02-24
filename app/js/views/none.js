define(['jquery', 'underscore', 'backbone', 'text!../../templates/none.html'], function($, a, b, template){
	var vNone= Backbone.View.extend({
		el: '#none',
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
	return vNone;
});