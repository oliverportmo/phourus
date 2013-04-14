define(['jquery', 'underscore', 'backbone', 'models/session', 'models/settings'], function($, _, Backbone, mSession, mSettings){
	var cStream= Backbone.Collection.extend({
		url: function(){
			var url= '/rest/stream/'+this.query();
			return url;	
		},
		query: function(){
			var string= '';
			var keys= _.keys(mSettings.attributes);
			_.each(keys, function(key){
				string+= key+'='+mSettings.attributes[key]+'&';
			});
			if(!_.isUndefined(mSession.get("token"))){
				string+= '&token='+mSession.get("token")+',';
			}
			string= '?'+string.substring(0, string.length - 1);
			return string;
		},
		idAttribute: 'id'
	});
	return cStream;
});	