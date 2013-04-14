define(['jquery', 'underscore', 'backbone', 'models/user', 'text!../../templates/user.html'], function($, _, Backbone, model, template){
	var vUser= Backbone.View.extend({
		el: '#user',
		tagName: 'div',
		
		initialize: function(){
	
		},
		
		load: function(id){
			var self= this;
			this.model= new model({id: id});
			this.model.fetch({
				success: function(){
					self.render();
				}
			});
		},
		
		render: function(){
			var data= this.model.toJSON();
			var compiled= _.template(template, {data: data});
			this.$el.html(compiled);
			return compiled;
		},
	});
	return vUser;
});