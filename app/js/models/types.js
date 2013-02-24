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
			
			var mind= {};
			mind.subjects= 'Subjects';
			mind.questions= 'Questions';
			mind.answers= 'Answers';
			mind.teachers= 'Teachers';
			
			var voice= {};
			voice.debates= 'Debates';
			voice.bills= 'Bills';
			voice.votes= 'Votes';
			voice.reps= 'Reps';
			
			var faith= {};
			faith.beliefs= 'Beliefs';
			faith.ranks= 'Ranks';
			faith.timeline= 'Timeline';
			faith.searching= 'Searching';
				
			var CORE= {element: 'core', sections: core};
			var EARTH= {element: 'earth', sections: earth};
			var MIND= {element: 'mind', sections: mind};
			var VOICE= {element: 'voice', sections: voice};
			var FAITH= {element: 'faith', sections: faith};
			this.set([CORE, EARTH, MIND, VOICE, FAITH]);
			
			var FIELDS= {};
			FIELDS.blogs= ["title", "element", "category", "privacy", "tags", "content"];
			FIELDS.events= ["title", "element", "category", "privacy", "tags", "content", "date", "address"];
			FIELDS.ideas= ["title", "element", "category", "privacy", "tags", "content"];
			FIELDS.links= ["url", "element", "category", "privacy", "tags", "content"];	 
			
			FIELDS.matters= ["title", "category", "privacy", "tags", "positive", "content"];
			
			FIELDS.subjects= ["title", "category", "privacy", "tags", "difficulty", "content"];
			FIELDS.questions= ["title", "category", "privacy", "tags", "difficulty", "content"];
			FIELDS.answers= ["title", "category", "privacy", "tags", "content"];
				
			FIELDS.debates= ["title", "category", "scope", "zip", "privacy", "tags", "content"];
			FIELDS.bills= ["debate", "question", "date", "content"];
			
			FIELDS.beliefs= ["title", "category", "privacy", "tags", "content"];
			FIELDS.timeline= ["title", "category", "privacy", "tags", "date", "content", "address"];
			PHOURUS.FIELDS= FIELDS;
				
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
		}
	});
	return mTypes;
});	