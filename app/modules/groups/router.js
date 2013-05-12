define(['jquery', 'underscore', 'backbone', 'marionette'], 
	function($, _, Backbone, marionette, init){	
		
		var router= Backbone.Marionette.AppRouter.extend({
	    	controller: controller,
	    	appRoutes: {
				'!groups': 'groups',
				'!groups/:settings': 'groups',
				'!group/:id': 'group',
				'!group/:id/:page': 'group'
			}
	    });
	    
		var controller= {
			groups: function(settings){
				var params= {params: settings};
				this.groupsFactory(params);
			},
			group: function(id, page){
				var params= {id: id, page: page};
				this.groupsFactory(params);
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