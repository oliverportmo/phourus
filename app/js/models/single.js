define(['jquery', 'underscore', 'backbone'], function($){
	var mSingle= Backbone.Model.extend({
		/*urlRoot: function(){
		    if (this.isNew()){
		      return "/rest/single";
		    } else {
		      return "/rest/single" + this.id;
		    }
		  },*/
		urlRoot: '/rest/single',
		defaults: {
			//title: 'Untitled',
			//content: 'Insert content here'
		}		
	});
	return mSingle;
});	