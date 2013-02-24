define(['jquery', 'underscore', 'backbone', 'models/user'], function($, a, b, mUser){
	var cStream= Backbone.Collection.extend({
		url: function(){
			var url= '/rest/stream'+this.query();
			return url;	
		},
		query: function(){
			var string= '';
			var keys= _.keys(PHOURUS.SETTINGS.attributes);
			_.each(keys, function(key){
				string+= key+'='+PHOURUS.SETTINGS.attributes[key]+'&';
			});
			if(!_.isUndefined(mUser.get("token"))){
				string+= '&token='+mUser.get("token")+',';
			}
			string= '?'+string.substring(0, string.length - 1);
			return string;
		},
		idAttribute: 'record'
	});
	return cStream;
});	