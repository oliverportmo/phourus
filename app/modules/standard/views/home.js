define(['jquery', 'underscore', 'backbone', 'text!../../../templates/home.html', 'models/types'], function($, _, Backbone, template, mTypes){
	var view= Backbone.View.extend({
		
		events: {
			'click .label': 'section'	
		},
		
		section: function(e){
			var id= $(e.currentTarget).attr('id');
			id= id.split(':');
			$('div#elements').show();
			$('div.info').hide();
			$('div.info#'+id[1]).show();
			$('div.element').hide();
			$('div.element#'+id[0]).show();
			/** TEMP **/
			$('div.element h2').hide();
			$('div.element ul.tabs').hide();
			$('div.element a#close').hide();
		},
		
		viewHelpers: {
			description: function(type){
			return mTypes.description(type);	
			}
		},
		
		render: function(){
			var data= mTypes.toJSON();
			delete data[0];
			_.extend(data, this.viewHelpers);
			console.log(data);
			var html= _.template(template, {data: data});
			this.$el.html(html);
			$('div#elements').hide();
			return this.el;
		}
	});
	return view;
});