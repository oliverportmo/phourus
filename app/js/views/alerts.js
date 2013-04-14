define(['jquery', 'underscore', 'backbone', 'text!../../templates/alert.html', 'collections/alerts', 'models/alert'], function($, _, Backbone, template, cAlerts, mAlert){
	var vAlerts= Backbone.View.extend({
		el: '#alerts',
		tagName: 'div',
		
		initialize: function(){	
			this.collection= new cAlerts();
			this.collection.bind('change', this.render, this);
		},
		
		events: {
			"click .close": "close"	
		},
		
		close: function(e){
			var id= e.currentTarget.id;
			var model= _.find(this.collection.models, function(model){
				if(model.cid=== id){
					model.set('hidden', true);	
				}
			});
			$(e.currentTarget).parent().remove();
		},
		
		add: function(type, message, code, debug){
			var alert= new mAlert({type: type, message: message, code: code});
			this.collection.add(alert);
			//debug(debug);
			this.render();
		},
		
		render: function(){
			var self= this.$el;
			self.html('');
			_.each(this.collection.models, function(model){
				if(model.get('hidden')!== true){
					var cid= {cid: model.cid};
					var alert= _.template(template, _.extend(model.toJSON(), cid));
					self.append(alert);	
				}
			});
		}
	});
	return new vAlerts();
});