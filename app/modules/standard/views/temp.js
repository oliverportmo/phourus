define(['jquery', 'underscore', 'backbone', 'text!../../../templates/temp.html'], function($, _, Backbone, template){
	var vTemp= Backbone.View.extend({
		
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
	return vTemp;
});