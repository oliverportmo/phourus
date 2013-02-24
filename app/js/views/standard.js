define(['jquery', 'underscore', 'backbone', 'text!../../templates/standard.html'], function($, a, b, template){
	var vStandard= Backbone.View.extend({
		el: '#standard',
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
	return vStandard;
});