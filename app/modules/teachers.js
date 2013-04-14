define(['jquery', 'underscore', 'backbone', 'text!../templates/temp.html'], function($, _, Backbone, tTemp){
	var TEACHERS= Backbone.View.extend({
		el: '#teachers',
		tagname: 'div',
		
		initialize: function(){
			this.render();
		},
		
		events: {

		},
		
		render: function(){
			var compiled= _.template(tTemp, {});
			$(this.el).html(compiled);
			return compiled;
		},
	});
	return TEACHERS;
});