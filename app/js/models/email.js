define(['jquery', 'underscore', 'backbone'], function($){
	var mEmail= Backbone.Model.extend({
		url: '/rest/email',
		
		defaults: {
			sender: 'info@phourus.com',
			subject: '',
			message: '',
			recipient: ''
		}
				
	});
	return mEmail;
});	