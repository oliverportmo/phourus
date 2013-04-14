define(['jquery', 'underscore', 'backbone', 'models/single', 'text!../../templates/meta.html', 'models/types'], function($, _, Backbone, model, tMeta, mTypes){
	var vSingle= Backbone.View.extend({
		el: '#single',
		tagName: 'div',
		
		initialize: function(){
			//window.onhashchange= this.hash;
			//this.hash();
		},
		
		hash: function(){
			var hash= window.location.hash;
			var slashed= hash.split('/');
			console.log(this);
			//this.load(slashed[1]);	
		},
		
		load: function(id){
			this.model= new model({id: id});
			var me= this;
			this.model.fetch({
				success: function(){
					me.render();
				}
			});
		},

		render: function(){	
			var compiled= _.template(this.template(), this.model.toJSON());
			this.$el.html(compiled);
			return compiled;
		},

		template: function(){
			//type= 'blogs';
			//var post= data;
			//var image= 'temp';
			//var image= PHOURUS.AUTH.pic(post);
			var output= '';
			var data= {data: this.model.toJSON()};
			var heading= _.template(tMeta, data);
			var interact= '<br clear="all" />';
			interact+= '<div id="social">';
			//interact+= social('like');
			interact+= '<span style="width: 20px">&nbsp;</span>';
			//interact+= social('share');
			interact+= '<br /><br />';
			//interact+= social('comments');
			interact+= '</div>';
			
			var type= this.model.get('type');
			var parent= mTypes.get_parent(type);
			output+= '<img src="/assets/icons/large/'+parent+'/<%= type %>.png" style="margin-right: 10px;">'; 
			output+= '<span style="display: block;padding-top: 4px;font-size: 20px; font-weight: bold; text-transform: uppercase;"><%= type %></span>';
			switch(type)
			{
				/** CORE **/
				case 'blogs':
					output+= '<h1 id="single_title"><%= title %></h1>';   
					output+= heading;    
					output+= '<div id="single_content" style="text-align: justify;"><%= content %></div>';
					output+= interact;
				break;
				case 'ideas':			
					output+= '<h1 id="single_title"><%= content %></h1>';   
					output+= heading;    
					output+= '<div id="single_content" style="text-align: justify;"><%= content %></div>';
					output+= interact;
				break;
				case 'links':
					//output+= '<h1><a href="../../themes/web/js/'+PHOURUS.FORMAT.format_url(post['url'])+'" target="_blank" id="single_url"></a></h1>';
					output+= '<h1 id="single_url" style="border: none;"><%= url %></h1>';   
					output+= heading;    
					output+= '<div id="single_content" style="text-align: justify;"><%= content %></div>';
					output+= interact;
				break;
				case 'events':
					output+= '<h1 id="single_title" style="border: none;"><%= title %></h1>';   
					output+= heading;    
					output+= '<div id="single_content" style="text-align: justify;"><%= content %></div>';
					output+= interact;
				break;
				
				/** EARTH **/
				case 'calculator':
					
				break;
				case 'checklist':

				break;
				case 'companies':
				
				break;
				case 'matters':
					output+= '<h1 id="single_title" style="border: none;"><%= url %></h1>';   
					output+= heading;    
					output+= '<div id="single_content" style="text-align: justify;"><%= content %></div>';
					output+= interact;
				break;
				
				/** MIND **/
				case 'questions':
					output+= '<h1 id="single_title" style="border: none;"><%= title %></h1>';   
					output+= heading;    
					output+= '<div id="single_content" style="text-align: justify;"><%= content %></div>';
					output+= interact;
				break;
				case 'answers':
					output+= '<h1 id="single_title" style="border: none;"><%= title %></h1>';   
					output+= heading;    
					output+= '<div id="single_content" style="text-align: justify;"><%= content %></div>';
					output+= interact;
				break;	
				case 'subjects':
					output+= '<h1 id="single_title" style="border: none;"><%= title %></h1>';   
					output+= heading;    
					output+= '<div id="single_content" style="text-align: justify;"><%= content %></div>';
					output+= interact;
				break;
				case 'scores':

				break;
				case 'courses':
				
				break;
				
				/** VOICE **/
				case 'debates':
					output+= '<h1 id="single_title" style="border: none;"><%= title %></h1>';   
					output+= heading;    
					output+= '<div id="single_content" style="text-align: justify;"><%= content %></div>';
					output+= interact;
				break;
				case 'votesx':
				
				break;
				case 'representativesx':
				
				break;
				
				/** FAITH **/
				case 'beliefs':
					output+= '<h1 id="single_title" style="border: none;"><%= title %></h1>';   
					output+= heading;    
					output+= '<div id="single_content" style="text-align: justify;"><%= content %></div>';
					output+= interact;
				break;
				case 'ranks':

				break;
				case 'timeline':
					output+= '<h1 id="single_title" style="border: none;"><%= title %></h1>';   
					output+= heading;    
					output+= '<div id="single_content" style="text-align: justify;"><%= content %></div>';
					output+= interact;
				break;
				default:
					
				break;
			}
			output+= '</div>';
			output+= '<div id="content-footer">';
			output+= '<a href="#!stream" class="button blue">&laquo; Back to Stream</a>';
			output+= '</div>';
			return output;
		}
	});
	return vSingle;
});