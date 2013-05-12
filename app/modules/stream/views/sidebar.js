define(['jquery', 'underscore', 'backbone', 'models/types', 'models/settings'], function($, _, Backbone, mTypes, mSettings){
	
	var vSidebar= Backbone.View.extend({		
		el: '#sidebare',
		tagName: 'div',
		
		initialize: function(){
			var me= this;	
			Backbone.history.bind("all", function(route, router){
				var page= window.location.hash;
				page= page.replace('!', '');
				page= page.replace('#', '');
				if(page=== 'core' || page=== 'earth' || page=== 'mind' || page=== 'voice' || page=== 'faith'){
					me.open(page);
				}
				if(page=== 'stream'){
					me.all();
				}
			});
		},

		events: {
			'click div.checkbox': 'toggle'
		},

		toggle: function(e){
			var target= e.currentTarget;
			$(target).toggleClass("on");	
			var types= '';
			$("div.checkbox").each(function(index, value) { 
				var id= $(this).attr('id'); 
				var on= $(this).hasClass('on');
				if(on== true)
				{
					 types+= id+";";	
				}
			});
			types = types.slice(0, types.length-1);
			mSettings.set("types", types);
		},
		
		open: function(input){
			var type= input;
			$('.filter').hide();
			$('.filter#'+type).show();
			_.each(mTypes.attributes, function(type){
				var element= type.element;
				if(element=== type){
					
				}else{
					
				}
			});
		},

		all: function(){
			$('.filter').show();
		},

		render: function(){
			var output= '';
			var me= this;
			var keys= 
			_.each(mTypes.attributes, function(type){
				var element= type.element;
				var filtered= _.omit(type.sections, ['govs', 'groups', 'teachers', 'companies']);
				output+= '<div id="'+element+'" class="filter">';
				output+= '<h3 class="'+element+'"><a href="#!'+element+'">'+element+'</a></h3>';	
				output+= me.filters(filtered);
				output+= '</div>';
			});
			$(this.el).append(output);
			return this.el;
		},
		
		filters: function(sections){		
			var output= '';
			output+= '<table style="width: 220px;">';
			_.each(sections, function(name)
			{
				var name= name.toLowerCase();
				//var name= _.keys(i)[0];
				var section= 'add';
				var func= 'onclick="add(\''+name+'\')"';
				var uri= 'add/'+name;
				if(name == 'calculator' || name == 'checklist' || name == 'budget'){
					section= 'view';	
					func= 'onclick="edit(\''+name+'\', \'edit\')"';
					uri= name;
				}
				if(name == 'companies' || name == 'courses' || name == 'reps' || name == 'searching'){
					section= 'search';
					func= 'onclick="listing(\''+name+'\')"';
					uri= name;	
				}
				//var icon= '<td><img src="/assets/icons/large/'.$type.'/'.$key.'.png" /></td>';
				var action= '<a href="#'+uri+'" id="action_'+name+'" class="action">'+section+'</a></td>';
				var title= '<td style="width: 180px;padding: 0px;margin: 0px;"><a href="javascript:void(0)" id="'+name+'" class="link">'+name+'</a> '+action+'</td>';
				var checkbox= '<td><div id="'+name+'" class="checkbox on"></div></td>';
				//$action= '<td><a href="javascript:void(0)" '.$function.'><img src="/assets/icons/general/'.$section.'.png" width="24" height="24" /></a></td>';
				output+= '<tr id="'+name+'" class="toggle">'+title+checkbox+'</tr>';
			});
			output+= '</table>';
			return output;	
		}
	});
	
	return vSidebar;
});