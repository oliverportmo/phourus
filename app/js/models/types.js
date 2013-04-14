define(['jquery', 'underscore', 'backbone'], function($){
	var mTypes= Backbone.Model.extend({
		initialize: function(){
			
			var core= {};
			core.blogs= 'Blogs';
			core.links= 'Links';
			core.ideas= 'Ideas';
			core.events= 'Events';
			
			var earth= {};
			earth.calculator= 'Calculator';
			earth.checklist= 'Checklist';
			earth.reports= 'Reports';
			earth.companies= 'Companies';
			//earth.stores= 'Stores';
			
			var mind= {};
			mind.subjects= 'Subjects';
			mind.questions= 'Questions';
			mind.answers= 'Answers';
			mind.teachers= 'Teachers';
			//mind.scores= 'Scores';
			
			var voice= {};
			voice.debates= 'Debates';
			voice.bills= 'Bills';
			voice.votes= 'Votes';
			voice.govs= 'Govs';
			//voice.budget= 'Budget';
			
			var self= {};
			self.beliefs= 'Beliefs';
			self.quotes= 'Quotes';
			self.timeline= 'Timeline';
			self.groups= 'Groups';
			//self.ranks= 'Ranks';
				
			var CORE= {element: 'core', sections: core};
			var EARTH= {element: 'earth', sections: earth};
			var MIND= {element: 'mind', sections: mind};
			var VOICE= {element: 'voice', sections: voice};
			var SELF= {element: 'self', sections: self};
			this.set([CORE, EARTH, MIND, VOICE, SELF]);				
		},	
		get_parent: function(child){
			var parent= '';
			_.each(this.attributes, function(element){
				var keys= _.keys(element.sections);
				_.each(keys, function(key){
					if(key=== child){
						parent= element.element;
					}
				});
			});	
			return parent;
		},
		schema: function(type){
			var schema= {};
			switch(type)
			{				
				/** CORE **/
				case 'blogs':
					schema.title= 'Text'; 
					schema.element= 'Text';
					schema.category= 'Text';
					schema.privacy= 'Text';
					schema.tags= 'Text';
					schema.content= 'Text'; 
				break;
				case 'links':
					schema.url= 'Text';
					schema.element= 'Text';
					schema.category= 'Text';
					schema.privacy= 'Text';
					schema.tags= 'Text';
					schema.content= 'Text';
				break;
				case 'ideas':
					schema.title= 'Text';
					schema.element= 'Text';
					schema.category= 'Text';
					schema.privacy= 'Text';
					schema.tags= 'Text';
					schema.content= 'Text';
				break;
				case 'events':
					schema.title= 'Text';
					schema.element= 'Text';
					schema.category= 'Text';
					schema.privacy= 'Text';
					schema.tags= 'Text'; 
					schema.content= 'Text'; 
					schema.date= 'Date';
					//schema.address= {type: 'NestedModel', model: Address };
				break;
				
				/** EARTH **/
				case 'calculator':
					//TOOL
				break;
				case 'checklist':
					//TOOL
				break;
				case 'reports':
					schema.title= 'Text';
					schema.category= 'Text';
					schema.privacy= 'Text';
					schema.tages= 'Text';
					schema.content= 'Text'; 
					schema.positive= 'Boolean';
				break;

				/** MIND **/
				case 'subjects':
					schema.title= 'Text';
					schema.category= 'Text';
					schema.subcategory= 'Text';
					schema.privacy= 'Text';
					schema.tags= 'Text';
					schema.content= 'Text';
					schema.difficulty= 'Text';
				break;
				case 'questions':
					schema.title= 'Text';
					schema.category= 'Text';
					schema.subcategory= 'Text';
					schema.privacy= 'Text';
					schema.tags= 'Text';
					schema.content= 'Text';
					schema.difficulty= 'Text';
				break;
				case 'answers':
					schema.question= 'Text';
					schema.content= 'Text';
				break;
				
				/** VOICE **/
				case 'debates':
					schema.title= 'Text';		
					schema.category= 'Text';
					schema.privacy= 'Text';
					schema.tags= 'Text';
					schema.content= 'Text';
					schema.scope= 'Text';
					schema.zip= 'Text';
				break;
				case 'votes':
					schema.vote= 'Text';
					schema.content= 'Text';  
					schema.source= 'Text';
				break;
				case 'bills':
					schema.debate= 'Text';
					schema.rep= 'Text';
					schema.content= 'Text';
					schema.question= 'Text';
					schema.deadline= 'Text';
				break;

				/** SELF **/
				case 'beliefs':
					schema.title= 'Text';
					schema.category= 'Text';
					schema.privacy= 'Text';
					schema.tags= 'Text'; 
					schema.content= 'Text';	
				break;
				case 'timeline':
					schema.title= 'Text';
					schema.category= 'Text';
					schema.privacy= 'Text';
					schema.tags= 'Text'
					schema.content= 'Text';
					//Datetime
					schema.date= 'Date';
					schema.time= 'Time';
					//schema.address= {type: 'NestedModel', model: Address };		
				break;
				case 'quotes':
					schema.quote= 'Text';
					schema.source= 'Text';
					schema.content= 'Text';
				break;
				default:
				
				break;
			}
			return schema;
		},
		
		dropdown: function(type, category){
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
		
		calculator: function(){
			var output;
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
	
					var output;
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
	return new mTypes();
});	