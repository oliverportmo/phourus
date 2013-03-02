define(['jquery', 'underscore', 'backbone', 'views/elements'], function($, a, b, vElements){
	var vHome= Backbone.View.extend({
		el: '#home',
		tagname: 'div',
		
		initialize: function(){
			this.render();
		},
		
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
		
		render: function(){
			var output= '<h1>Welcome to Phourus</h1><br />';
			_.each(PHOURUS.TYPES.attributes, function(type){
				var element= type.element;
				var sections= type.sections;
				if(element!== 'core'){ 	
					output+= '<div class="box-home">';
					output+= '<a href="javascript:void(0)" class="button-home" id="'+element+'"></a>';
					//$output.= 'description';
					output+= '<ul>';
						_.each(sections, function(section){
							output+= '<li><a href="javascript:void(0)"><img src="/assets/icons/large/'+element+'/'+section+'.png" class="icon" /><div class="label" id="'+element+':'+section+'">'+section+'</div><br clear="left" /></a></li>';
						});
					output+= '</ul>';	
					output+= '</div>';
				}
			});
			output+= '<div id="elements"></div>';
			output+= '<br clear="all" />';
			this.$el.html(output);
			
			var elements= new vElements();
			return output;
		},
	});
	return vHome;
});