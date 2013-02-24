define(['jquery', 'underscore', 'backbone', 'text!../../templates/header.html', 'views/login'], function($, a, b, template, vLogin){
	var vHeader= Backbone.View.extend({
		el: '#header',
		tagName: 'header',
		
		initialize: function(){
			this.render();	
		},
		
		render: function(){
			var data= {};
			var compiled= _.template(template, data);
			this.$el.html(compiled);
			this.login= new vLogin();
			return compiled;
		},
	});
	return vHeader;
});