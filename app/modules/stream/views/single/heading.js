define(['jquery', 'underscore', 'backbone', 'text!../../../../../templates/single/heading.html'], function($, _, Backbone, template){
	var view= Backbone.View.extend({
	
		render: function(){
			var data= this.model.toJSON();
			var compiled= _.template(template, {data: data});
			this.$el.html(compiled);
			console.log(compiled);
			return compiled;
		},
	});
	return view;
});