define(['jquery', 'underscore', 'backbone'], function($){
	var mSettings= Backbone.Model.extend({
		//urlRoot: '/api/single/1',

		defaults: {
			debug: false,
			sort: 'influence',
			direction: 'DESC',
			type: 'stream',
			page: 0,
			limit: 10,
			types: 'blogs;ideas;links;events;calculator;checklist;matters;companies;subjects;questions;answers;teachers;debates;bills;votes;reps;beliefs;ranks;timeline;searching'
		}
	});
	return mSettings;
});	