define(['jquery', 'underscore', 'backbone', 'text!../templates/types.html'], function($, _, Backbone, template){
	var widget= Backbone.View.extend({
		tagName: 'div',
		
		initialize: function(options){
			this.el= options.el;
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