define(['jquery', 'underscore', 'backbone', 'views/home', 'views/stream', 'views/single', 'views/contact', 'views/standard', 'views/user', 'views/form', 'views/register', 'views/footer', 'views/header', 'views/none', 'models/settings', '../../modules/govs', '../../modules/groups', '../../modules/teachers', '../../modules/companies'], function($, _, Backbone, vHome, vStream, vSingle, vContact, vStandard, vUser, vForm, vRegister, vFooter, vHeader, vNone, mSettings, GOVS, GROUPS, TEACHERS, COMPANIES){ 	
	var router= Backbone.Router.extend({
		
		initialize: function(){
			//Need to rethink PHOURUS, perhaps IoC container
			window.PHOURUS= {};
			PHOURUS.HEADER= new vHeader();
			PHOURUS.FOOTER= new vFooter();
			$('div.content').hide();
			//this.stream();
		},
		
		routes: {
			'': 'homepage',
			'!home': 'homepage',
			'!stream': 'stream',
			'!single/:record': 'single',
			'add/:type': 'add',
			'edit/:id': 'edit',
			'user/:id': 'user',
			'me': 'profile',
			'contact': 'contact',
			'register': 'register',
			'privacy': 'standard',
			'terms': 'standard',
			
			'!core': 'element',
			'!earth': 'element',
			'!mind': 'element',
			'!voice': 'element',
			'!self': 'element',
			
			'!govs': 'govs',
			'!groups': 'groups',
			'!teachers': 'teachers',
			'!companies': 'companies',

			':none': 'none'
		},
		
		element: function(){
			if(!PHOURUS.STREAM){ PHOURUS.STREAM= new vStream(); }
			this.show('stream');
		},
		govs: function(){
			if(!PHOURUS.GOVS){ PHOURUS.GOVS= new GOVS(); }	
			this.show('govs');
		},
		groups: function(){
			if(!PHOURUS.GROUPS){ PHOURUS.GROUPS= new GROUPS(); }	
			this.show('groups');
		},
		teachers: function(){
			if(!PHOURUS.TEACHERS){ PHOURUS.TEACHERS= new TEACHERS(); }	
			this.show('teachers');
		},
		companies: function(){
			if(!PHOURUS.COMPANIES){ PHOURUS.COMPANIES= new COMPANIES(); }	
			this.show('companies');
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
		user: function(id){
			if(!PHOURUS.USER){ PHOURUS.USER= new vUser(); }
			PHOURUS.USER.load(id);
			this.show('user');
		},
		add: function(type){
			if(!PHOURUS.FORM){ PHOURUS.FORM= new vForm(); }
			PHOURUS.FORM.add(type);
			this.show('form');
		},
		edit: function(id){
			if(!PHOURUS.FORM){ PHOURUS.FORM= new vForm(); }
			PHOURUS.FORM.edit(id);
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
   	return new router();
});