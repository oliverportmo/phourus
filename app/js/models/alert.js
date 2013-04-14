define(['jquery', 'underscore', 'backbone'], function($, _, Backbone){
	var mAlert= Backbone.Model.extend({
		defaults: {
			hidden: false
		}		
	});
	return mAlert;
});	