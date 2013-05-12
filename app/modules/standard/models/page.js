define(['jquery', 'underscore', 'backbone'], function($, _, Backbone){
	var model= Backbone.Model.extend({
		initialize: function(options){
			this.id= options.id;	
		},
		urlRoot: function(){
			return '/rest/page/'+this.id;
		},
		defaults: {
			title: 'Page not found',
			content: 'Sorry, but the page you were looking for does not exist.'
		}		
	});
	return model;
});	