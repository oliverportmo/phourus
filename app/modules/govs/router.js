define(['jquery', 'underscore', 'backbone', 'marionette'], 
	function($, _, Backbone, marionette){	
		
		var router= Backbone.Marionette.AppRouter.extend({
	    	controller: controller,
	    	appRoutes: {
				'!govs': 'govs',
				'!govs/signup': 'govsignup',
				'!govs/admin': 'govadmin',
				'!govs/:settings': 'govs', 
				'!gov/:id': 'gov',
				'!gov/:id/:page': 'gov',
			}	
	    });
	    
		var controller= {
			govs: function(settings){
				var self= this;
				var params= {section: 'home', params: settings};
				require(['../modules/govs/views/home'], function(view){
					self.toss(view, params);
	            });
			},
			gov: function(id, page){
				var self= this;
				if(_.isUndefined(page) || page== ''){ 
					page= 'basic';
				}
				var params= {id: id, page: page};
				require(['../modules/govs/views/gov'], function(view){
					self.toss(view, params);
	            });
			},
			govsignup: function(){
				var self= this;
				var params= {section: 'signup', params: ''};	
				require(['../modules/govs/views/signup'], function(view){
					self.toss(view, params);
	            });
			},
			govadmin: function(){
				var self= this;
				var params= {section: 'admin', params: ''};
				require(['../modules/govs/views/admin'], function(view){
					self.toss(view, params);
	            });	
			},
			toss: function(view, params){
				var data= {view: view, params: params, id: 'govs'};
				Backbone.Events.trigger('module', data, this);
			}
		}
		return new router({controller: controller});
});