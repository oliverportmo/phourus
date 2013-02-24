define(['jquery', 'underscore', 'backbone', 'text!../../templates/post.html'], function($, a, b, template){
	var iPost= Backbone.View.extend({
		el: '.post',
		tagName: 'div',
		
		initialize: function(){
			this.render();	
		},
		
		render: function(){
			var data= {};
			var compiled= _.template(template, {data: data});
			this.$el.html(compiled);
			return compiled;
		},
	});
	return iPost;
});