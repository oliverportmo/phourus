define(['jquery', 'underscore', 'backbone', 'text!../../templates/gov/heading.html'], function($, _, Backbone, template){
	var view= Backbone.View.extend({
		el: '#gov-heading',
		tagName: 'div',
		
		initialize: function(){
			this.render();	
		},
		
		render: function(){
			var data= {city: 'Boston', state: 'MA', population: '1,225,442', users: '12,323', reps: '23'};
			var compiled= _.template(template, {data: data});
			this.$el.html(compiled);
			return compiled;
		},
	});
	return view;
});