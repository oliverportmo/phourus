define(['jquery', 'underscore', 'backbone', 'forms', 'text!../../templates/form.html', 'models/single', 'models/types', 'collections/alerts'], function($, _, Backbone, forms, tForm, mSingle, mTypes, cAlerts){
	var vForm= Backbone.View.extend({
		el: '#form',
		tagName: 'div',
		
		initialize: function(){
			this.model= new mSingle();	
		},
		
		add: function(type){
			this.model.clear();
			this.render('add', type, '');
		},
		
		edit: function(type, id){
			var self= this;
			this.model.fetch({
				success: function(){
					self.render('edit', type, id);
				},
				error: function(model, response){
					cAlerts.add(response, 'vForm', 'edit', 'error');
				}
			});	
		},
		
		render: function(mode, type, id){	
			var data= {};
			data.mode= mode;
			data.type= type;
			data.id= id;
			data.action= 'Add';
			if(data.mode== 'edit'){ 
				data.action= 'Edit'; 
				data.title= type; 
			}
			if(data.mode== 'add'){ 
				data.title= data.type.slice(0, data.type.length-1); 
				if(data.type== 'timeline'){ title= 'Timeline'; } 
			}	
					
			var compiled= _.template(tForm, {data: data});
			this.$el.html(compiled);
			this.form(data.type);
			return compiled;
		},
		
		form: function(type){	
			console.log(type);		
			var schema= mTypes.schema(type);				
			_.extend(this.model, {schema: schema});
			var form= new Backbone.Form({model: this.model});
			$('#fields').html(form.render().el);
		},		
	});
	return vForm;
});