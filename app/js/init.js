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
        forms: {
        	deps: ['backbone'],
	      	exports: 'forms'  
        },
        jquery: {
            exports: '$'
        }
    }
});
window.debug= function(input){
	console.log(input);
}

define(['jquery', 'underscore', 'backbone', 'router/router', 'models/types', 'models/settings', 'models/session', 'collections/alerts', 'auth'], function($, _, Backbone, router, mTypes, mSettings, mSession, cAlerts, auth){	
	
	//This section should be put somewhere else
	/** TOKEN **/
	var token= 'guest';
	if(!_.isNull(localStorage.getItem("user"))){
		var data= $.parseJSON(localStorage.getItem("user"));
		mSession.set(data);
		
		if(mSession.expired()){
			mSession.clear();	
			localStorage.removeItem("user");
		}else{
			token= mSession.get('token'); 	 
	    }
	}
	
	// ** X-API-KEY **/
	//@token is either 'guest' or valid session token
	Backbone._sync= Backbone.sync;
    var TokenSync= function(method, model, options) {
        options.headers = options.headers || {};
        _.extend(options.headers, { 'x-api-key': token });
        Backbone._sync(method, model, options);
    };
    Backbone.sync= TokenSync; 
    
    /** HISTORY **/
	Backbone.history = Backbone.history || new Backbone.History({});
   	Backbone.history.start();	 
});


  

