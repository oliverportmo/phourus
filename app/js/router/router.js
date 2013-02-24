define(['jquery', 'underscore', 'backbone', 'views/home', 'views/stream', 'views/single', 'views/contact', 'views/standard', 'views/profile', 'views/form', 'views/register', 'views/footer', 'views/header', 'views/none', 'models/settings'], function($, a, b, vHome, vStream, vSingle, vContact, vStandard, vProfile, vForm, vRegister, vFooter, vHeader, vNone, mSettings){ 	
	var router= Backbone.Router.extend({
		
		initialize: function(){
			PHOURUS.HEADER= new vHeader();
			PHOURUS.FOOTER= new vFooter();
			PHOURUS.SETTINGS= new mSettings();
			$('div.content').hide();
			//this.stream();
		},
		
		routes: {
			'': 'homepage',
			'!home': 'homepage',
			'!stream': 'stream',
			'!single/:record': 'single',
			'add/:type': 'add',
			'edit/:record': 'edit',
			'profile/:record': 'profile',
			'me': 'profile',
			'contact': 'contact',
			'register': 'register',
			'privacy': 'standard',
			'terms': 'standard',
			
			'!core': 'element',
			'!earth': 'element',
			'!mind': 'element',
			'!voice': 'element',
			'!faith': 'element',

			':none': 'none'
		},
		
		element: function(){
			if(!PHOURUS.STREAM){ PHOURUS.STREAM= new vStream(); }
			this.show('stream');
		},
		homepage: function(){
			if(!PHOURUS.HOME){ PHOURUS.HOME= new vHome(); }
			this.show('home');
		},
		stream: function(){	
			if(!PHOURUS.STREAM){ PHOURUS.STREAM= new vStream(); }
			this.show('stream');
		},
		single: function(record){
			if(!PHOURUS.SINGLE){ PHOURUS.SINGLE= new vSingle(); }
			PHOURUS.SINGLE.load(record);
			this.show('single');
		},
		contact: function(){
			if(!PHOURUS.CONTACT){ PHOURUS.CONTACT= new vContact(); }
			this.show('contact');
		},
		profile: function(record){
			if(!PHOURUS.PROFILE){ PHOURUS.PROFILE= new vProfile(); }
			PHOURUS.PROFILE.load(record);
			this.show('profile');
		},
		add: function(type){
			if(!PHOURUS.FORM){ PHOURUS.FORM= new vForm(); }
			PHOURUS.FORM.add(type);
			this.show('form');
		},
		edit: function(record){
			if(!PHOURUS.FORM){ PHOURUS.FORM= new vForm(); }
			PHOURUS.FORM.edit(record);
			this.show('form');
		},
		register: function(){
			if(!PHOURUS.REGISTER){ PHOURUS.REGISTER= new vRegister(); }
			this.show('register');
		},
		standard: function(){
			if(!PHOURUS.STANDARD){ PHOURUS.STANDARD= new vStandard(); }	
			this.show('standard');	
		},
		none: function(){
			if(!PHOURUS.NONE){ PHOURUS.NONE= new vNone(); }	
			this.show('none');	
		},
		show: function(input){
			$('div#elements').hide();
			$('div.content').hide();
			$('div.content#'+input).show();
		}
	});
   	return router;
});