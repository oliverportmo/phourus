define(['jquery', 'underscore', 'backbone', 'marionette'], 
	function($, _, Backbone, marionette, init){	
		
		var router= Backbone.Marionette.AppRouter.extend({
	    	controller: controller,
	    	appRoutes: {
				'!stream': 'stream',
				'!single/:record': 'single',
				'add/:type': 'add',
				'edit/:id': 'edit',		
			}		
	    });
	    
		var controller= {
			stream: function(){	
				var self= this;
				var params= {mode: 'stream'};
				require(['../modules/stream/views/stream'], function(view){
					self.toss(view, params);
	            });
			},
			single: function(id){
				var self= this;
				var params= {id: id};
				require(['../modules/stream/views/single'], function(view){
					self.toss(view, params);
	            });
			},	
			add: function(type){
				var self= this;
				var params= {mode: 'add', type: type};
				require(['../modules/stream/views/form'], function(view){
					self.toss(view, params);
	            });
			},
			edit: function(id){
				var self= this;
				var params= {mode: 'edit', id: id};
				require(['../modules/stream/views/form'], function(view){
					self.toss(view, params);
	            });
			},
			toss: function(view, params){
				var data= {view: view, params: params, id: 'stream'};
				Backbone.Events.trigger('module', data, this);
			}		
		}
		return new router({controller: controller});
});