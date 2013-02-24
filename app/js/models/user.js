define(['jquery', 'underscore', 'backbone'], function($){
	var mUser= Backbone.Model.extend({
		urlRoot: '/rest/user',
		expired: function(){
			var expires= this.get('expires');
			var now= this.now();
			console.log('Expires: '+expires+'     Now: '+now);
			var expired= expires < now;
			return expired;	
		},
		now: function(){
			var date= new Date().toISOString();
			var output= date.replace('T', ' ');
			output= output.split('.');
			return output[0];	
		},
		defaults: {

		}		
	});
	return new mUser();
});	