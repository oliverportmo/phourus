define(['jquery', 'underscore', 'backbone', 'text!../../templates/footer.html'], function($, _, Backbone, template){
	var view= Backbone.View.extend({
		el: '#footer',
		tagName: 'footer',
		
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
	return view;
});