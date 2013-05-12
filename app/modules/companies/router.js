define(['jquery', 'underscore', 'backbone', 'marionette'], 
	function($, _, Backbone, marionette, init){	
		
		var router= Backbone.Marionette.AppRouter.extend({
	    	controller: controller,
	    	appRoutes: {
				'!companies': 'companies',
				'!companies/:settings': 'companies',
				'!company/:id': 'company',
				'!company/:id/:page': 'company'
			}	
	    });
	    
		var controller= {		
			companies: function(settings){
				var params= {params: settings};
				this.factory(params);
			},
			company: function(id, page){
				var params= {id: id, page: page};
				this.factory(params);
			},
			factory: function(params){
				var view= new init();
				view.trigger('router', params);
				this.show(view);
			},
			show: function(module){
				Backbone.Events.trigger('module', module);
			}
		}
		return new router({controller: controller});
	}
);