define(['jquery', 'underscore', 'backbone', 'forms', 'text!../../templates/form.html', 'models/single'], function($, a, b, forms, tForm, mSingle){
	var vForm= Backbone.View.extend({
		el: '#form',
		tagName: 'div',
		
		initialize: function(){
			this.model= new mSingle();
			this.type= 'blogs';
			this.mode= 'add';
			//this.render();	
		},
		
		add: function(type){
			this.model.clear();
			this.mode= 'add';
			this.type= type;
			this.render();
		},
		
		edit: function(record){
			this.mode= 'edit';
			//Replace with some logic?
			this.type= 'blogs';
			var me= this;
			//Fetch with Record
			this.model.fetch({
				success: function(){
					me.render();
				},
				error: function(model, response){
					PHOURUS.ERRORS.add(response, 'vForm', 'edit', 'error');
				}
			});	
		},
		
		render: function(mode, type){	
			this.model.set('action', 'add');
			this.model.set('mode', 'add');
			//meta.action= 'Add';
			//meta.mode= 'add';		
			var compiled= _.template(tForm, {data: this.model.toJSON()});
			this.$el.html(compiled);
			this.template();
			return compiled;
		},
		
		template: function(){
			var mode= this.mode;
			var type= this.type;
			var action= 'Add New';
			var title;
			if(mode== 'edit'){ action= 'Edit'; title= type; }
			if(mode== 'add'){ title= type.slice(0, type.length-1); if(type== 'timeline'){ title= 'Timeline'; } }
			var output= '';
			
			output+= '<h1>'+action+' '+title+'</h1>';
			if(mode== 'edit'){
				output+= '<% if(data.user == "USE-120403-001-A"){ %>';
			}
			output+= '<form action="" method="post" id="form_'+mode+'">';
			
			var schema= {};	
			switch(type)
			{				
				/** EARTH **/
				case 'events':
					schema.title= 'Text';
					schema.date= 'Date';
					//schema.address= {type: 'NestedModel', model: Address };
				break;
				case 'checklist':
					output+= this.checklist();
				break;
				case 'calculator':
					output+= this.calculator();
				break;
				default: 
					output+= '<table>';
					output+= '<colgroup><col class="sidebar-form" /></colgroup>';
					output+= this.form(type);
					output+= '</table>';
				break;
			}
			_.extend(this.model, { schema: schema});
			
			console.log(_.extend(this.model, meta));
			var form= new Backbone.Form();
			console.log(form.render());
			$('#fields').html(form.render());
			output+= '<input type="hidden" name="hidden_type" value="'+type+'" />';
			if(mode== 'edit'){ output+= '<input type="hidden" name="hidden_record" />'; }
			output+= '</form>';
			output+= '</div>';
			//Footer
			output+= '<div id="content-footer">';
			var function_add= 'onclick="PHOURUS.DATA.add();"';
			function_add= '';
			var function_edit= 'onclick="PHOURUS.DATA.edit();"';
			function_edit= '';
			if(mode== 'add')
			{
				output+= '<input type="button" value="Create New" class="button green" '+function_add+' />';
				output+= '<a href="#!stream" class="button red">Cancel Create</a>';
			}
			if(mode== 'edit')
			{
				output+= '<input type="button" value="Save Changes" class="button green" '+function_edit+' />';
				output+= '<a href="#!stream" class="button red">Cancel Edit</a>';
			}
			if(mode== 'edit'){	
				output+= '<% }else{ %>';
				output+= "<h3>Sorry, but we can\'t let you edit another user's post!</h3>";
				output+= '<% } %>';
			}
			return output;	
		},
		
		dropdown: function(type, category)
		{
			var output= '';
			switch(type)
			{
				case 'privacy':
					output+= '<select name="select_privacy">';
					output+= '<option value="0">Only Me</option>';
					output+= '<option value="1">Friends Only</option>';
					output+= '<option value="2">Everyone</option>';
					output+= '<option value="3">Publish</option>';
					output+= '</select>';
				break;
				case 'scope':
					output+= '<select name="select_scope">';
					output+= '<option value="local">Local (City/Town)</option>';
					output+= '<option value="state">State</option>';
					output+= '<option value="national">National</option>';
					output+= '</select>';
				break;
				case 'difficulty':
					output+= '<select name="select_difficulty">';
					output+= '<option value="easy">Easy</option>';
					output+= '<option value="medium">Medium</option>';
					output+= '<option value="hard">Hard</option>';
					output+= '</select>';
				break;
				case 'date':
					output+= '<select name="select_date">';
					output+= '<option value="2012">2012</option>';
					output+= '<option value="2011">2011</option>';
					output+= '<option value="2010">2010</option>';
					output+= '</select>';
				break;
				case 'category':
					output+= '<select name="select_category">';
					output+= '</select>';
				break;
				default:
					output+= '<select name="select_element">';
					output+= '<option value="earth">Earth</option>';	
					output+= '<option value="voice">Voice</option>';	
					output+= '<option value="mind">Mind</option>';	
					output+= '<option value="faith">Faith</option>';	
					output+= '</select>';	
				break;
			}
			return output;
		},
		
		form: function(type){
			var output= '';
			var BASE= {};
			//Add Limit, Validation
			BASE.title= '<tr><td>Title</td><td><input type="text" name="input_title" /></td></tr>';
			BASE.category= '<tr><td>Category</td><td>'+this.dropdown('category', type)+'</td></tr>';
			BASE.url= '<tr><td>URL</td><td><input type="text" name="input_url" /></td></tr>';
			BASE.address= '<tr><td>Address</td><td>ADDRESS WIDGET</td></tr>';
			BASE.positive= '<tr><td>Positive</td><td><input type="checkbox" name="check_positive" /></td></tr>';
			BASE.debate= '<tr><td>Debate</td><td><a href="#!debates/"><%= data.debate %></a></td></tr>';
			BASE.question= '<tr><td>Question</td><td><input type="text" name="input_question" /></td></tr>';
			BASE.tags= '<tr><td>Tags</td><td><input type="text" name="input_tags" /></td></tr>';
			BASE.difficulty= '<tr><td>Difficulty</td><td>'+this.dropdown('difficulty')+'</td></tr>';
			BASE.element= '<tr><td>Element</td><td>'+this.dropdown('elements')+'</td></tr>';
			BASE.privacy= '<tr><td>Privacy</td><td>'+this.dropdown('privacy')+'</td></tr>';
			BASE.scope= '<tr><td>Scope</td><td>'+this.dropdown('scope')+'</td></tr>';
			BASE.date= '<tr><td>Date</td><td>'+this.dropdown('date')+'</td></tr>';
			BASE.zip= '<tr><td>Zip</td><td><input type="text" name="input_zip" /></td></tr>';
			BASE.content= '<tr><td>Content</td><td><textarea name="text_content" class="rte"><%= data.content %></textarea></td></tr>';
			
			_.each(PHOURUS.FIELDS[type], function(field){
				output+= BASE[field];
			});
			return output;
		},
		
		calculator: function(){
			output+= '<table>';
					output+= '<tr><td colspan="2"><h2>Step 1. Basic</h2></td></tr>';
					output+= '<tr><td><label>Individual</label></td><td><div class="checkbox"></div></td></tr>';
					output+= '<tr><td><label>Household</label></td><td><input type="text" /></td></tr>';
					output+= '<tr><td colspan="2"><h2>Step 2. Electric</h2>';
					output+= '<tr><td><label>Average Electric Bill</label></td><td><input type="text" /></td></tr>';
					output+= '<tr><td><label>Kilowatt Hour</label></td><td><input type="" /></td></tr>';
					output+= '<tr><td colspan="2"><h2>Step 3. Heat</h2>';
					output+= '<tr><td><label>Average Electric Bill</label></td><td><input type="text" /></td></tr>';
					output+= '<tr><td><label>Kilowatt Hour</label></td><td><input type="text" /></td></tr>';
					output+= '<tr><td colspan="2"><h2>Step 4. Car</h2></td></tr>';
					output+= '<tr><td><label>MPG</label></td><td><select><option>No Car</option><option>Less than 20 (Large)</option><option>20-30 (Mid-size)</option><option>30-40 (Small)</option><option>40+ (Hybrid)</option></select></td></tr>';
					output+= '<tr><td><label>Average Annual Miles</label></td><td><input type="text" /></td></tr>';
					output+= '<tr><td colspan="2"><h2>Step 5. Air</h2></td></tr>';
					output+= '<tr><td><label>Hours of Flight</label></td><td><input type="text" /></td></tr>';
					//output+= '<tr><td colspan="2"><h2>Step 6. Recycling</h2></td></tr>';
					output+= '</table>';
					return output;
					//facebook('comments');
		},
		
		checklist: function(){
			var list= new Array();
					list.push('Compost waste');
					list.push('Recycle paper and plastic');
					list.push('Properly dispose of electronic waste (TV, Computer, Batteries etc.)');
					list.push('Drive 25 MPG or higher vehicle');
					list.push('Drive 35 MPG or higher vehicle');
					list.push('Replace Incandescent Light Bulbs with CFLs (Compact Fluorescent Lamp)');
					list.push('Use Cold Water to wash clothes when possible');
					list.push('Purchase local meat, eggs and dairy');
					list.push('Minimize bottled water purchases by using reusable containers and purified tap water');
					list.push('Install a wind, solar or geothermal system');
					list.push('Make your own cleaning products');
					list.push('Plant a garden');
					list.push('Stop using reusable bags');
					list.push('Minimize time artificial light is on, use natural light');
					list.push('Pay as many bills online as possible');
					list.push('Unsubscribe to as much solicited or unsolicited mail as possible');
					list.push('Consider second-hand products from Craigslist, GiGoIt or Freecycle before buying new');
					list.push('Use a clothesline to dry your clothes instead of a dryer');
					list.push('Use cloth instead of paper towels and napkins');
					list.push('Use smart power strips');
					list.push('Minimize printing');
					list.push('Eliminate or reduce work commute');
					list.push('Be conservative with heat and air conditioning');
					list.push('Install low-flow faucets');
					list.push('Install low-flow shower heads');
					list.push('Install low-flow toilets');
					list.push('Use library instead of buying books and DVDs');
					list.push('Purchase and return Give Certificates™');
					list.push('Use native plants for landscaping');
					list.push('Turn car off if idle for more than 1 minute');
					list.push('Repurpose plastic containers, glass jars and other packaging');
					list.push('Neutralize your carbon footprint');
					list.push('Buy eco-friendly products');
					list.push('Buy eco-friendly appliances');
	
					output+= '<table id="checklist">';
					output+= '<colgroup><col style="background-color:#eee; border-right: solid 8px #aaa;"></col><col style="background-color: #fff;" /></colgroup>';
					output+= '<tfoot><tr><td colspan="2"></td></tr></tfoot>';
					var i= 0;
					
					var value;
					if(view== 'community')
					{
						value= '44%';
					}
					for(var row in list)
					{
						i++;
						value= '<div class="checkbox on" id="c'+i+'"></div>';
						output+= '<tr><td>'+value+'</td><td><span style="text-align:left; color: #555;">'+i+'. '+list[row]+'</span></td></tr>';
					}
					output+= '</table>';
					//facebook('comments'); 
					return output;
		}
	});
	return vForm;
});
/**
			switch(type)
			{
				/** CORE **
				case 'blogs':	
					var fields= ["title", "element", "category", "tags", "content"];
					fields.title= BASE.title;
					output+= '<table>';
					output+= '<colgroup><col class="sidebar-form" /></colgroup>';
					//output+= '<tr><td></td><td><strong>'+action+' Blog</strong></td></tr>';
					output+= '<tr><td>Title</td><td><input name="input_title" type="text" value="" /></td></tr>';
					output+= '<tr><td>Element</td><td>'+elements+'</td></tr>';
					output+= '<tr><td>Category</td><td><input name="input_category" type="text"/></td></tr>';
					output+= '<tr><td>Tags</td><td><input name="input_tags" type="text"/></td></tr>';
					output+= '<tr><td>Privacy</td><td>'+privacy+'</td></tr>';
					output+= '<tr><td>Content</td><td><textarea name="text_content" class="rte"><%= data.content %></textarea></td></tr>';     		
					output+= '</table>';	
					output+= '<h4>Content</h4>';
					output+= '<textarea name="text_content" class="rte"></textarea>';	
				break;
				case 'events':
					var fields= ["title", "element", "category", "tags", "content"];
				break;
				case 'ideas':
					var fields= ["title", "element", "category", "tags", "content"];
					output+= '<table>';
					output+= '<colgroup><col class="sidebar-form" /></colgroup>';
					//output+= '<tr><td></td><td><strong>'+action+' Idea</strong></td></tr>';
					output+= '<tr><td>Title</td><td><input type="text" name="input_title" /></td></tr>';
					output+= '<tr><td>Element</td><td>'+elements+'</td></tr>';
					output+= '<tr><td>Category</td><td><input type="text" name="input_category" /></td></tr>';
					output+= '<tr><td>Tags</td><td><input type="text" name="input_tags" /></td></tr>';
					output+= '<tr><td>Privacy</td><td>'+privacy+'</td></tr>';
					output+= '<tr><td>Content</td><td><textarea name="text_content"></textarea></td></tr>';   	
					output+= '</table>'; 
				break;
				case 'links':	 
					output+= '<table>';
					output+= '<colgroup><col class="sidebar-form" /></colgroup>';
					//output+= '<tr><td></td><td><strong>'+action+' Link</strong></td></tr>';
					output+= '<tr><td>URL</td><td><input type="text" name="input_url" /></td></tr>';
					output+= '<tr><td>Element</td><td>'+elements+'</td></tr>';
					output+= '<tr><td>Category</td><td><input type="text" name="input_category" /></td></tr>';               
					output+= '<tr><td>Tags</td><td><input type="text" name="input_tags" /></td></tr>'; 
					output+= '<tr><td>Privacy</td><td>'+privacy+'</td></tr>';
					output+= '<tr><td>Description</td><td><textarea name="text_content"></textarea></td></tr>';  	
					output+= '</table>';
				break;
				
				/** EARTH **
				case 'checklist':
					var list= new Array();
					list.push('Compost waste');
					list.push('Recycle paper and plastic');
					list.push('Properly dispose of electronic waste (TV, Computer, Batteries etc.)');
					list.push('Drive 25 MPG or higher vehicle');
					list.push('Drive 35 MPG or higher vehicle');
					list.push('Replace Incandescent Light Bulbs with CFLs (Compact Fluorescent Lamp)');
					list.push('Use Cold Water to wash clothes when possible');
					list.push('Purchase local meat, eggs and dairy');
					list.push('Minimize bottled water purchases by using reusable containers and purified tap water');
					list.push('Install a wind, solar or geothermal system');
					list.push('Make your own cleaning products');
					list.push('Plant a garden');
					list.push('Stop using reusable bags');
					list.push('Minimize time artificial light is on, use natural light');
					list.push('Pay as many bills online as possible');
					list.push('Unsubscribe to as much solicited or unsolicited mail as possible');
					list.push('Consider second-hand products from Craigslist, GiGoIt or Freecycle before buying new');
					list.push('Use a clothesline to dry your clothes instead of a dryer');
					list.push('Use cloth instead of paper towels and napkins');
					list.push('Use smart power strips');
					list.push('Minimize printing');
					list.push('Eliminate or reduce work commute');
					list.push('Be conservative with heat and air conditioning');
					list.push('Install low-flow faucets');
					list.push('Install low-flow shower heads');
					list.push('Install low-flow toilets');
					list.push('Use library instead of buying books and DVDs');
					list.push('Purchase and return Give Certificates™');
					list.push('Use native plants for landscaping');
					list.push('Turn car off if idle for more than 1 minute');
					list.push('Repurpose plastic containers, glass jars and other packaging');
					list.push('Neutralize your carbon footprint');
					list.push('Buy eco-friendly products');
					list.push('Buy eco-friendly appliances');
	
					output+= '<table id="checklist">';
					output+= '<colgroup><col style="background-color:#eee; border-right: solid 8px #aaa;"></col><col style="background-color: #fff;" /></colgroup>';
					output+= '<tfoot><tr><td colspan="2"></td></tr></tfoot>';
					var i= 0;
					
					var value;
					if(view== 'community')
					{
						value= '44%';
					}
					for(var row in list)
					{
						i++;
						value= '<div class="checkbox on" id="c'+i+'"></div>';
						output+= '<tr><td>'+value+'</td><td><span style="text-align:left; color: #555;">'+i+'. '+list[row]+'</span></td></tr>';
					}
					output+= '</table>';
					//facebook('comments'); 
	
				break;
				case 'calculator':
					output+= '<table>';
					output+= '<tr><td colspan="2"><h2>Step 1. Basic</h2></td></tr>';
					output+= '<tr><td><label>Individual</label></td><td><div class="checkbox"></div></td></tr>';
					output+= '<tr><td><label>Household</label></td><td><input type="text" /></td></tr>';
					output+= '<tr><td colspan="2"><h2>Step 2. Electric</h2>';
					output+= '<tr><td><label>Average Electric Bill</label></td><td><input type="text" /></td></tr>';
					output+= '<tr><td><label>Kilowatt Hour</label></td><td><input type="" /></td></tr>';
					output+= '<tr><td colspan="2"><h2>Step 3. Heat</h2>';
					output+= '<tr><td><label>Average Electric Bill</label></td><td><input type="text" /></td></tr>';
					output+= '<tr><td><label>Kilowatt Hour</label></td><td><input type="text" /></td></tr>';
					output+= '<tr><td colspan="2"><h2>Step 4. Car</h2></td></tr>';
					output+= '<tr><td><label>MPG</label></td><td><select><option>No Car</option><option>Less than 20 (Large)</option><option>20-30 (Mid-size)</option><option>30-40 (Small)</option><option>40+ (Hybrid)</option></select></td></tr>';
					output+= '<tr><td><label>Average Annual Miles</label></td><td><input type="text" /></td></tr>';
					output+= '<tr><td colspan="2"><h2>Step 5. Air</h2></td></tr>';
					output+= '<tr><td><label>Hours of Flight</label></td><td><input type="text" /></td></tr>';
					//output+= '<tr><td colspan="2"><h2>Step 6. Recycling</h2></td></tr>';
					output+= '</table>';
					//facebook('comments');
				break;
				
				/** MIND **
				//Courses
				case 'subjects':
					output+= '<table>';
					output+= '<colgroup><col class="sidebar-form" /></colgroup>';
					//output+= '<tr><td></td><td><strong>'+action+' Subject</strong></td></tr>';
					output+= '<tr><td>Title</td><td><input type="text" name="input_title" /></td></tr>';
					output+= '<tr><td>Category</td><td><input type="text" name="input_category" /></td></tr>';              
					output+= '<tr><td>Tags</td><td><input type="text" name="input_tags" /></td></tr>';
					output+= '<tr><td>Privacy</td><td>'+privacy+'</td></tr>';                
					output+= '<tr><td>Content</td><td><textarea name="text_content"></textarea></td></tr>';    	
					output+= '</table>';
				break;
				case 'scores':
					output+= '<table>';
					output+= '<colgroup><col class="sidebar-form" /></colgroup>';
					//output+= '<tr><td></td><td><strong>'+action+' Question</strong></td></tr>';
					output+= '<tr><td>Title</td><td><input type="text" name="input_title" /></td></tr>';
					output+= '<tr><td>Category</td><td><input type="text" name="input_category" /></td></tr>';               
					output+= '<tr><td>Tags</td><td><input type="text" name="input_tags" /></td></tr>';
					output+= '<tr><td>Privacy</td><td>'+privacy+'</td></tr>';
					output+= '<tr><td>Content</td><td><textarea name="text_content"></textarea></td></tr>';    	
					output+= '</table>';
				break;
				
				/** VOICE **
				//Votes
				//Representatives
				case 'debates':
					output+= '<table>';
					output+= '<colgroup><col class="sidebar-form" /></colgroup>';
					//output+= '<tr><td></td><td><strong>'+action+' Debate</strong></td></tr>';
					output+= '<tr><td>Title</td><td><input type="text" name="input_title" /></td></tr>';
					output+= '<tr><td>Scope</td><td>'+scope+'</td></tr>';
					output+= '<tr><td>Category</td><td><input type="text" name="input_category" /></td></tr>';               
					output+= '<tr><td>Tags</td><td><input type="text" name="input_tags" /></td></tr>';
					output+= '<tr><td>Privacy</td><td>'+privacy+'</td></tr>';
					output+= '<tr><td>Content</td><td><textarea name="text_content"></textarea></td></tr>';    	
					output+= '</table>';
				break;
				
				/** FAITH **
				//Ranks
				case 'beliefs':
					output+= '<table>';
					output+= '<colgroup><col class="sidebar-form" /></colgroup>';
					//output+= '<tr><td></td><td><strong>'+action+' Belief</strong></td></tr>';
					output+= '<tr><td>Title</td><td><input type="text" name="input_title" /></td></tr>';
					output+= '<tr><td>Category</td><td><input type="text" name="input_category" /></td></tr>';               
					output+= '<tr><td>Tags</td><td><input type="text" name="input_tags" /></td></tr>';
					output+= '<tr><td>Privacy</td><td>'+privacy+'</td></tr>';
					output+= '<tr><td>Content</td><td><textarea name="text_content"></textarea></td></tr>';    	
					output+= '</table>';				
				break;
				case 'timeline':
					output+= '<table>';
					output+= '<colgroup><col class="sidebar-form" /></colgroup>';
					//output+= '<tr><td></td><td><strong>'+action+' Event</strong></td></tr>';
					output+= '<tr><td>Title</td><td><input type="text" name="input_title" /></td></tr>';
					output+= '<tr><td>Date</td><td>'+date+'</td></tr>';
					output+= '<tr><td>Category</td><td><input type="text" name="input_category" /></td></tr>';               
					output+= '<tr><td>Tags</td><td><input type="text" name="input_tags" /></td></tr>';
					output+= '<tr><td>Privacy</td><td>'+privacy+'</td></tr>';
					output+= '<tr><td>Content</td><td><textarea name="text_content"></textarea></td></tr>';    	
					output+= '</table>';			
				break;
			}**/