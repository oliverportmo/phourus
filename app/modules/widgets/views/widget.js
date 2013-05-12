define(['jquery', 'underscore', 'backbone', 'text!../templates/widget.html', '../collections/views'], function($, _, Backbone, template, cViews){
	var vWidget= Backbone.View.extend({
		tagName: 'div',
		className: 'widget',
		
		initialize: function(options){
			this.options= options;	
			this.render();
		},
		
		render: function(){
			var widget= this.options;
			var compiled= _.template(template, {widget: widget});
			this.$el.html(compiled);
			
			this.views= {};
			var self= this;
			_.each(widget.views, function(view){
				if(!_.isUndefined(cViews[view])){
					var v= cViews[view].view;
					var el= '#'+widget.name+'-'+view;
					if(!_.isUndefined(cViews[view]) && !_.isUndefined(cViews[view].view)){
						var params= {params: cViews[view].params, el: el};
						self.views[view]= new v(params);
						$(self.views[view].el).append(self.views[view].render());
					}else{
						console.log(view+' widget could not be loaded');	
					}
				}
			});	
			return this.$el;
		},
	});
	return vWidget;
});