define(['jquery', 'underscore', 'backbone', 'text!../../templates/register.html', 'text!../../templates/email/signup.html', 'models/register', 'models/email', 'views/alerts'], function($, a, b, template, tSignup, mRegister, mEmail,  vAlerts){
	var vRegister= Backbone.View.extend({
		el: '#register',
		tagName: 'div',
		
		initialize: function(){
			this.render();	
			
		},
		
		events: {
			"click #complete": "register"
		},
		
		
		register: function(){
			this.model= new mRegister(this.collect());
			var self= this;
			this.model.save({}, {
				success: function(model, response){
					var message= 'Registration was successful. Check your email for your password and account information.';
						message+= '<br /><strong>Password:</strong> '+response.password;
						
					vAlerts.add('complete', message, '1', '');
					
					var data= self.collect();
					message= _.template(tSignup, data);
					var email= new mEmail({recipient: data.first, subject: 'Your Phourus Password', message: message});
					email.save({
						success: function(){
							
						},
						error: function(){
							vAlerts.add('message', 'Registration was successful, but there was an error sending your email. Please contact us if you do not receive your password.', '1', '');
						}
					})
					//DEMO PASSWORD
				},
				error: function(model, response){
					console.log(model);
					console.log(response);
				}
			});	
		},
		
		collect: function(){
			
			var me= this;
			var output= {
				first: $('#first').val(),
				last: $('#last').val(),
				email: $('#email').val(),
				password: $('#password').val()
			};
			return output;
		},
		
		render: function(){
			var data= {};
			var compiled= _.template(template, data);
			this.$el.html(compiled);
			return compiled;
		},
	});
	return vRegister;
});