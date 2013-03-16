require.config({
	paths: {
		jquery: '/app/lib/jquery',
		underscore: '/app/lib/underscore',
		backbone: '/app/lib/backbone',
		text: '/app/lib/text',
		forms: '/app/lib/forms',
		auth: '/app/lib/auth',
		firefly: '/app/lib/firefly'
	},
	shim: {
        backbone: {
            deps: ['jquery', 'underscore'],
            exports: 'Backbone'
        },
        underscore: {
            exports: '_'
        },
        jquery: {
            exports: '$'
        }
    }
});
var PHOURUS= PHOURUS || {};
window.debug= function(input){
	if(PHOURUS.SETTINGS.debug=== true){
		console.log(input);
	}
}

define(['jquery', 'underscore', 'backbone', 'router/router', 'models/types', 'models/settings', 'models/user', 'collections/alerts', 'auth'], function($, _, Backbone, rPhourus, mTypes, mSettings, mUser, cAlerts, auth){	
	PHOURUS.TYPES= new mTypes();
	PHOURUS.EVENTS= _.extend({}, Backbone.Events);
	//PHOURUS.ALERTS= new cAlerts();
	PHOURUS.SETTINGS= new mSettings();
	PHOURUS.SETTINGS.debug= true;
	PHOURUS.SETTINGS.dev= true;
	var token= 'guest';
	if(!_.isNull(localStorage.getItem("user"))){
		var data= $.parseJSON(localStorage.getItem("user"));
		mUser.set(data);
		
		if(mUser.expired()){
			mUser.clear();	
			localStorage.removeItem("user");
		}else{
			token= mUser.get('token'); 	 
	    }
	}
	
	Backbone._sync= Backbone.sync;
    var TokenSync= function(method, model, options) {
        options.headers = options.headers || {};
        _.extend(options.headers, { 'x-api-key': token });
        //return originalSync.call(model, method, model, options);
        Backbone._sync(method, model, options);
    };
    Backbone.sync= TokenSync; 
    
    PHOURUS.ROUTER= new rPhourus();
	Backbone.history = Backbone.history || new Backbone.History({});
   	Backbone.history.start();	  
 	return PHOURUS;
});


  

