define(['jquery', 'underscore', 'backbone', 'marionette'], 
	function($, _, Backbone, marionette, init){	
		
		var router= Backbone.Marionette.AppRouter.extend({
	    	controller: controller,
	    	appRoutes: {
				'!schools': 'schools',
				'!schools/:settings': 'schools',
				'!school/:id': 'school',
				'!school/:id/:page': 'school'
			}	
	    });
	    
		var controller= {
			schools: function(settings){
				var params= {params: settings};
				this.factory(params);
			},
			school: function(id, page){
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
});