define(['jquery', 'underscore', 'backbone', 'text!../../../templates/page.html', '../models/page'], function($, _, Backbone, template, model){
	var view= Backbone.View.extend({
		
		initialize: function(options){
			var that= this;
			this.model= new model(options.page);
			this.model.fetch({
				success: function(){
					that.render();	
				},
				error: function(){
					that.render();
				}
			})	
		},
		
		render: function(){
			var compiled= _.template(template, {data: this.model.toJSON()});
			this.$el.html(compiled);
			return compiled;
		},
	});
	return view;
});