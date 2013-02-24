define(['jquery', 'underscore', 'backbone'], function($){
	var mRegister= Backbone.Model.extend({
		urlRoot: '/rest/register',				
		defaults: {

		},	
		parse: function(response){
			if(response.error=== 1){
				vAlerts.add('error', response.data, 1, response.debug);
				return false;
			}
			return response.data;			
		}	
	});
	return mRegister;
});	