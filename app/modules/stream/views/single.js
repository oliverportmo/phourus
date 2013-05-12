define(['jquery', 'underscore', 'backbone', '../../../modules/stream/models/single', 'text!../../../templates/single.html', '../views/single/heading', 'models/types'], function($, _, Backbone, model, template, vHeading, mTypes){
	var view= Backbone.View.extend({
		
		initialize: function(options){
			this.load(options.id);
		},
		
		load: function(id){
			this.model= new model({id: id});
			var self= this;
			this.model.fetch({
				success: function(){
					self.render();
				}
			});
		},

		render: function(){		
			var type= this.model.get('type');
			var element= mTypes.get_parent(type);
			this.model.set('element', element);
				
			var compiled= _.template(template, {data: this.model.toJSON()});
			this.$el.html(compiled);
			
			this.subviews({
		        '#heading': new vHeading({model: this.model})
		    });

			return compiled;
		},
	});
	return view;
});