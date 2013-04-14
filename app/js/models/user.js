define(['jquery', 'underscore', 'backbone'], function($, _, Backbone){
	var mUser= Backbone.Model.extend({
		urlRoot: function(){
			return '/rest/user/';
		}	
	});
	return mUser;
});	