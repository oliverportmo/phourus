define(['jquery', 'underscore', 'backbone'], function($){
	var vHome= Backbone.View.extend({
		el: '#home',
		tagname: 'div',
		
		initialize: function(){
			this.render();
		},
		
		render: function(){
			var output= '<h1>Welcome to Phourus</h1><br />';
			_.each(PHOURUS.TYPES.attributes, function(type){
				var element= type.element;
				var sections= type.sections;
				if(element!== 'core'){ 	
					output+= '<div class="box-home">';
					output+= '<a href="#!stream" class="button-home" id="'+element+'"></a>';
					//$output.= 'description';
					output+= '<ul>';
						_.each(sections, function(section){
							output+= '<li><a href="#!stream"><img src="/assets/icons/large/'+element+'/'+section+'.png" class="icon" /><div class="label">'+section+'</div><br clear="left" /></a></li>';
						});
					output+= '</ul>';	
					output+= '</div>';
				}
			});
			output+= '<br clear="all" />';
			this.$el.html(output);
			return output;
		},
	});
	return vHome;
});