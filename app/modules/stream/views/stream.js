define(['jquery', 'underscore', 'backbone', '../../../modules/stream/views/sidebar', '../../../modules/stream/views/filter', 'views/elements', 'views/alerts', '../../../modules/stream/collections/stream', 'text!../../../templates/stream.html', 'text!../../../templates/post.html', 'models/types', 'models/settings'], function($, _, Backbone, vSidebar, vFilter, vElements, vAlerts, cStream, tStream, tPost, mTypes, mSettings){
	var view= Backbone.View.extend({
		className: "stream",
		
		initialize: function(){
			_.bindAll(this);
			mSettings.bind('change', this.filter);
			this.filter();
		},
		
		events: {
			"click #customize": "customize"	
		},
		
		customize: function(e){
			var hidden= $("#sidebar").css('display') === 'none' ? true : false;
			if(hidden=== true){
				$("#customize").html('&laquo; Less Options');
				$("#sidebar").show();
				$("#dynamic").css('width', '700px');
			}else{
				$("#customize").html('More Options &raquo;');
				$("#sidebar").hide();
				$("#dynamic").css('width', '100%');
			}
				
		},
		
		filter: function(){		
			this.collection= new cStream();
			var me= this;
			this.collection.fetch({
				success: function(){
					me.update();
				},
				error: function(collection, response){
					vAlerts.add(response, 'vStream', 'filter', 'error');
				}
			});
		},
		
		update: function(){	
			$('#dynamic').html('');
			_.each(this.collection.models, function(model){
				var post= model.toJSON();
				post.element= mTypes.get_parent(post.type);
				$('#dynamic').append(_.template(tPost, {data: post}));
			});
		},

		render: function(){
			var compiled= _.template(tStream, {});
			this.$el.html(compiled);
				
			this.subviews({
		        '#sidebar': new vSidebar(),
		        '#filter': new vFilter()
		    });
    
			return this.el;
		}
	});
	return view;
});