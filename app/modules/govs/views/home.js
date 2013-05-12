define(['jquery', 'underscore', 'backbone', 'marionette', 'text!../../../templates/home.html', 'text!../../../templates/list.html', '../collections/govs'], function($, _, Backbone, marionette, template, iList, cGovs){
	var view= Backbone.Marionette.CompositeView.extend({
		
		initialize: function(){
			var raw= new Array();
			raw.push({city: 'Boston', state: 'MA', population: '1,225,442', users: '12,323', reps: '23'});
			raw.push({city: 'Mountain View', state: 'CA', population: '109,342', users: '4,560', reps: '3'});
			raw.push({city: 'Newport Beach', state: 'CA', population: '28,359', users: '1,243', reps: '1'});
			this.collection= new cGovs(raw);
			this.render();	
		},
		
		render: function(){
			var data= {};
			var compiled= _.template(template, data);
			this.$el.html(compiled);
			
			var list= $('#list');
			_.each(this.collection.models, function(model){
				var item= _.template(iList, {data: model.toJSON()});
				console.log(item);
				$('#list').append(item);	
			});
			return compiled;
		}
	});
	return view;
});