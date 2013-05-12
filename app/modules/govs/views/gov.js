define(['jquery', 'underscore', 'backbone', 'text!../../../templates/gov.html', '../views/gov/basic', '../views/gov/details', '../views/gov/contact', '../views/gov/more', '../views/gov/heading'], function($, _, Backbone, template, vBasic, vDetails, vContact, vMore, vHeading){
	var view= Backbone.View.extend({
		
		initialize: function(){
			this.render();
			$('#gov-sections').children().hide();
			this.on('page', this.page);
		},
		
		events: {
			'click a': 'tab'
		},
		
		tab: function(e){
			var id= e.currentTarget.id;
			var page= id.replace('tab-', '');
			this.trigger('page', page);
		},
		
		page: function(page){
			console.log(page);
			$('#gov-sections').children().hide();
			$('#gov-'+page).show();
		},
		
		render: function(){
			var data= {};
			var compiled= _.template(template, data);
			this.$el.html(compiled);
				
			//$('#gov-sections').children().hide();
			//$('#gov-sections').children().first().show();
			
			this.subviews({
		        '#gov-basic': new vBasic(),	
		        '#gov-details': new vDetails(),
		        '#gov-contact': new vContact(),
		        '#gov-more': new vMore(),
		        '#gov-heading': new vHeading()
		    });
			return compiled;
		}
	});
	return view;
});