var base= '../../widgets/views/';
define(['jquery', 'underscore', 'backbone',
base+'climate',
base+'contact',
base+'demographics',
base+'emergency',
base+'events',
base+'facebook',
base+'twitter',
base+'types',
base+'websites',
base+'maps',
base+'regions',
base+'calendar',
base+'org',
base+'financial',
base+'budget',
base+'rfq',
base+'projects',
base+'reviews'
], function($, _, Backbone,
vClimate,
vContact,
vDemographics,
vEmergency,
vEvents,
vFacebook,
vTwitter,
vTypes,
vWebsites,
vMap,
vRegions,
vCalendar,
vOrg,
vFinancial,
vBudget,
vRFQ,
vProjects, 
vReviews
){
	var cWidgets= Backbone.Collection.extend({
		//model: mWidget
		
	});
	var views= {
		
		/** BASIC **/
		//BASIC: Phourus Voice
		debates: {
			view: vTypes,
			params: ['debates'] 
		},
		bills: {
			view: vTypes,
			params: ['bills'] 
		},
		votes: {
			view: vTypes,
			params: ['votes'] 
		},
		
		//BASIC: Social Media
		twitter: {
			view: vTwitter,
			params: []
		},
		facebook: {
			view: vFacebook,
			params: []
		},
		
		//BASIC: Phourus Community
		users: {
			view: vTypes,
			params: ['users'] 
		},
		reps: {
			view: vTypes,
			params: ['reps']
		},
		
		/** DETAILS **/
		//DETAILS: Maps
		map: {
			view: vMap,
			params: ['map'] 
		},
		yelp: {
			view: vMap,
			params: ['yelp'] 
		},
		neighborhoods: {
			view: vMap,
			params: ['neighborhood']
		},
		zip: {
			view: vMap,
			params: ['zip'] 
		},
		
		//DETAILS: Regions
		regions: {
			view: vRegions,
			params: [] 
		},
		
		//DETAILS: Climate & Demographics
		climate: {
			view: vClimate,
			params: [] 
		},
		demographics: {
			view: vDemographics,
			params: [] 
		},
		
		//DETAILS: Websites
		websites: {
			view: vWebsites,
			params: []
		},
		
		//DETAILS: Event Calendar
		calendar: {
			view: vCalendar,
			params: [] 
		},
		
		/** CONTACT **/
		contact: {
			view: vContact,
			params: []	
		},
		
		emergency: {
			views: vEmergency,
			params: []	
		},
		
		/** MORE **/
		org: {
			view: vOrg,
			params: [] 
		},
		financial: {
			view: vFinancial,
			params: [] 
		},
		budget: {
			view: vBudget,
			params: []
		},
		rfq: {
			view: vRFQ,
			params: ['zip'] 
		},
		projects: {
			view: vProjects,
			params: []
		},
		reviews: {
			view: vReviews,
			params: []	
		},
		temp: {}
	}
	return views;
});	