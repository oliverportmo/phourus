define(['jquery', 'underscore', 'backbone'], function($, _, Backbone){
	var model= Backbone.Model.extend({
		defaults: {
			params: []
		}		
	});
	return model;
});	