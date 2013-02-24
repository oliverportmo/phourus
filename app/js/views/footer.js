define(['jquery', 'underscore', 'backbone', 'init', 'text!../../templates/footer.html'], function($, a, b, PH, template){
	var vFooter= Backbone.View.extend({
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
	return vFooter;
});