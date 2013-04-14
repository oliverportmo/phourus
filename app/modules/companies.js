define(['jquery', 'underscore', 'backbone', 'text!../templates/temp.html'], function($, _, Backbone, tTemp){
	var COMPANIES= Backbone.View.extend({
		el: '#companies',
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
	return COMPANIES;
});