define(['jquery', 'underscore', 'backbone', 'views/sidebar', 'views/filter', 'views/elements', 'views/alerts', 'collections/stream', 'text!../../templates/stream.html', 'text!../../templates/post.html'], function($, a, b, vSidebar, vFilter, vElements, vAlerts, cStream, tStream, tPost){
	var vStream= Backbone.View.extend({
		el: '#stream',
		tagName: 'div',
		
		initialize: function(){
			_.bindAll(this);
			PHOURUS.SETTINGS.bind('change', this.filter);
			this.render();	
			this.filter();
		},
		
		filter: function(){		
			this.collection= new cStream();
			var me= this;
			this.collection.fetch({
				success: function(){
					me.update();
				},
				error: function(collection, response){
					PHOURUS.ERRORS.add(response, 'vStream', 'filter', 'error');
				}
			});
		},
		
		update: function(){	
			$('#dynamic').html('');
			_.each(this.collection.models, function(model){
				var post= model.toJSON();
				post.element= PHOURUS.TYPES.get_parent(post.type);
				$('#dynamic').append(_.template(tPost, {data: post}));
			});
		},

		render: function(){
			var compiled= _.template(tStream, {});
			this.$el.html(compiled);
		
			var sidebar= new vSidebar();
			var filter= new vFilter();
			var elements= new vElements();
			return compiled;
		},
	});
	return vStream;
});