define(['jquery', 'underscore', 'backbone', 'models/settings', 'text!../../templates/filter.html'], function($, _, Backbone, mSettings, tFilter){	
	var vFilter= Backbone.View.extend({
		el: '#filter',
		tagName: 'div',
		
		initialize: function(){
			this.render();	
		},
		
		events: {
			"change #sort": "selected",
			"change #direction": "selected",
			"change #type": "create",
			"click ul#mode li a": "mode",	
		},
		
		create: function(e){
			var id= e.currentTarget.id;
			var value= e.currentTarget.value;
			window.location.hash= '#add/'+value;
		},
		
		selected: function(e){
			var id= e.currentTarget.id;
			var value= e.currentTarget.value;
			mSettings.set(id, value);
		},
		
		mode: function(e){
			var mode= e.currentTarget.id;
			if(mode !== 'group'){
				$("ul#mode li a").removeClass("selected");
				$("ul#mode li a#"+mode).addClass("selected");
				mSettings.set("mode", mode);
			}	
		},
		
		render: function(){
			var data= {};
			var compiled= _.template(tFilter, data);
			this.$el.html(compiled);
			return compiled;
		},
	});
	return vFilter;
});