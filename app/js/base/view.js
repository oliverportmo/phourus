define(['jquery', 'backbone', 'underscore'], function($, Backbone, _){
	var view= Backbone.View.extend({
		/** http://www.joezimjs.com/javascript/backbone-js-subview-rendering-trick/ **/
		subviews: function (selector, view) {
		    var selectors;
		    if (_.isObject(selector)) {
		        selectors = selector;
		    }
		    else {
		        selectors = {};
		        selectors[selector] = view;
		    }
		 
		    if (!selectors) return;
		    console.log(selectors);
		    _.each(selectors, function (view, selector) {
		        view.setElement(this.$(selector)).render();
		    }, this);
		}
	});
	return view;
});