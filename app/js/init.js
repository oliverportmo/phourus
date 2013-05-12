require.config({
	paths: {
		jquery: '/app/lib/jquery',
		underscore: '/app/lib/underscore',
		backbone: '/app/lib/backbone',
		marionette: '/app/lib/marionette',
		text: '/app/lib/text',
		forms: '/app/lib/forms',
		auth: '/app/lib/auth',
		firefly: '/app/lib/firefly',
		BaseView: '/app/js/base/view'
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
        },
        marionette : {
	      deps : ['jquery', 'underscore', 'backbone'],
	      exports : 'Marionette'
	    }
    }
});

window.debug= function(input){
	console.log(input);
}
define(function(require){
	var $= require('jquery');
	var _= require('underscore');
	var Backbone= require('backbone');
	var marionette= require('marionette');
	var mSession= require('models/session');
	var vHeader= require('views/header');
	var vFooter= require('views/footer');
	var routers= require('routers/routers');
	var BaseCollection= require('../js/base/collection');
	var BaseModel= require('../js/base/model');
	var BaseView= require('../js/base/view');
	
	
	var app= new Backbone.Marionette.Application();
	
	// Header & Footer
	app.addInitializer(function(options){
		app.header= new vHeader();
		app.footer= new vFooter();
	});
	
	// Content
	app.addRegions({
		'content': '#content'
	});
	
	// Routers
	app.addInitializer(function(options){
		var self= this;
		
		Backbone.Events.on('module', function(data){
			var view= data.view;
			app.content.show(new view(data.params));
		});
	});
	
	// Backbone.History
	app.on('initialize:after', function(options){
		Backbone.history = Backbone.history || new Backbone.History({});
		Backbone.history.start();
	});
	
	// Token
	app.on('initialize:before', function(options){
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
	    
	    Backbone.View= BaseView; 
	    Backbone.Model= BaseModel; 
	    Backbone.Collection= BaseCollection;   
	});
	
	// Start
	app.on('start', function(options){
		
	});
	
	var options= {};
	app.start(options);	
	return app;	
}); 