define(['jquery', 'underscore', 'backbone'], function($){
	var mEmail= Backbone.Model.extend({
		url: '/rest/email',
		
		defaults: {
			sender_name: 'Phourus.com',
			sender_email: 'info@phourus.com',
			recipient_name: '',
			recipient_email: '',
			subject: '',
			message: ''
		}
				
	});
	return mEmail;
});	