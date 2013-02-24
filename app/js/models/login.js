define(['jquery', 'underscore', 'backbone'], function($, a, b){
	var mLogin= Backbone.Model.extend({
		url: function(){
			var url= '/rest/login?email='+this.get('email')+'&password='+this.get('password');
			return url;	
		}/*,
		parse: function(response){
			console.log(response);
			if(response.error=== 1){
				vAlerts.add('error', response.data, 1, response.debug);
				return false;
			}
			console.log(response.data);
			return response.data;			
		}	*/
	});
	return mLogin;
});	