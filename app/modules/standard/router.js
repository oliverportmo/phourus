define(['jquery', 'underscore', 'backbone', 'marionette'], 
	function($, _, Backbone, marionette, init){	
		
		var router= Backbone.Marionette.AppRouter.extend({
	    	controller: controller,
	    	appRoutes: {
				'': 'homepage',
				'!home': 'homepage',	
				'contact': 'contact',
				'temp': 'temp',
				
				//User
				'register': 'register',
				'me': 'user',
				'user/:id': 'user',
				
				//Elements
				'!core': 'standard',
				'!earth': 'standard',
				'!mind': 'standard',
				'!voice': 'standard',
				'!self': 'standard',
	
				//Page
				':page': 'page'	
			}	
	    });
	    
		var controller= {
			homepage: function(){
				var self= this;
				var params= {page: 'home'};
				require(['../modules/standard/views/home'], function(view){
					self.toss(view, params);
	            });
			},
			contact: function(){
				var self= this;
				var params= {page: 'contact'};
				require(['../modules/standard/views/contact'], function(view){
					self.toss(view, params);
	            });
			},
		    register: function(){
				var self= this;
				var params= {page: 'register'};
				require(['../modules/standard/views/register'], function(view){
					self.toss(view, params);
	            });
			},
			standard: function(){
				var self= this;
				var params= {page: 'standard'};
				require(['../modules/standard/views/standard'], function(view){
					self.toss(view, params);
	            });
			},
			temp: function(){
				var self= this;
				var params= {page: 'temp'};
				require(['../modules/standard/views/temp'], function(view){
					self.toss(view, params);
	            });
			},
			user: function(id){
				var self= this;
				var params= {page: 'user', user: id};
				require(['../modules/standard/views/user'], function(view){
					self.toss(view, params);
	            });
			},
			page: function(page){
				var self= this;
				var params= {page: page};
				require(['../modules/standard/views/page'], function(view){
					self.toss(view, params);
	            });
			},
			toss: function(view, params){
				var data= {view: view, params: params, id: 'standard'};
				Backbone.Events.trigger('module', data, this);
			}
		}
		return new router({controller: controller});
});