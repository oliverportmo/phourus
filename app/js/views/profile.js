define(['jquery', 'underscore', 'backbone', 'models/profile', 'text!../../templates/profile.html'], function($, a, b, model, template){
	var vProfile= Backbone.View.extend({
		el: '#profile',
		tagName: 'div',
		
		initialize: function(){
	
		},
		
		load: function(record){
			var me= this;
			this.model= new model({id: record});
			this.model.fetch({
				success: function(){
					me.render();
				}
			});
		},
		
		render: function(){
			console.log(this.model.toJSON());
			var compiled= _.template(template, {data: this.model.toJSON()});
			this.$el.html(compiled);
			return compiled;
		},
	});
	return vProfile;
});