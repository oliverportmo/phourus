define(['jquery', 'underscore', 'backbone', 'text!../../templates/elements.html'], function($, _, Backbone, template){
	var vElements= Backbone.View.extend({
		el: '#elements',
		tagName: 'div',
		
		initialize: function(){
			this.render();	
			$('#elements').hide();
			var me= this;
			Backbone.history.bind("all", function(route, router){
				var page= window.location.hash;
				page= page.replace('!', '');
				page= page.replace('#', '');
				if(page=== 'core' || page=== 'earth' || page=== 'mind' || page=== 'voice' || page=== 'self'){
					me.open(page);
				}	
			});
		},

		events: {
			'click #close': 'close',
			'hashchange': 'open',
			'click ul#sections li a': 'select'
		},

		select: function(e){
			var id= e.currentTarget.id;
			$('.info').hide();
			$('.info#'+id).show();
		},
		
		close: function(){
			$('#elements').hide();
		},

		open: function(element){
			$('.info').hide();
			$('.element#'+element+' div.info').first().show();
			$('.element').hide();
			$('.element#'+element).show();
			$('#elements').show();
		},
		
		render: function(){
			var data= {};
			var compiled= _.template(template, data);
			this.$el.html(compiled);
			return compiled;
		}
	});
	return vElements;
});