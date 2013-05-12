define(['jquery', 'underscore', 'backbone', 'text!../../../templates/contact.html', 'firefly'], function($, _, Backbone, template, firefly){
	var view= Backbone.View.extend({
		
		initialize: function(){
	
		},
		
		render: function(){
			var data= {};
			var compiled= _.template(template, data);
			this.$el.html(compiled);
			return compiled;
		}
	});
	return view;
});