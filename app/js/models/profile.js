define(['jquery', 'underscore', 'backbone'], function($){
	var mProfile= Backbone.Model.extend({
		urlRoot: '/rest/profile',
		defaults: {

		},		
	});
	return mProfile;
});	