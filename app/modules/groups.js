define(['jquery', 'underscore', 'backbone', 'text!../templates/temp.html'], function($, _, Backbone, tTemp){
	var GROUPS= Backbone.View.extend({
		el: '#groups',
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
	return GROUPS;
});