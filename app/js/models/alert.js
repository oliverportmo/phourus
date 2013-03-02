define(['jquery', 'underscore', 'backbone'], function($){
	var mAlert= Backbone.Model.extend({
		defaults: {
			hidden: false
		}		
	});
	return mAlert;
});	