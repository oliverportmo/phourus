define(['jquery', 'underscore', 'backbone', 'text!../../templates/login.html', 'text!../../templates/logout.html', 'text!../../templates/forgot.html', 'text!../../templates/email/password.html', 'models/login', 'models/user', 'models/email', 'views/alerts'], function($, a, b, tLogin, tLogout, tForgot, tPassword, mLogin, mUser, mEmail, vAlerts){
	var vLogin= Backbone.View.extend({
		el: '#login',
		tagName: 'div',
		
		initialize: function(){
			_.bindAll(this);
			this.bind("login", this.session);
			this.render();
		},
		
		events: {
			'click #auth': 'login',
			'click #logout': 'logout',
			'click #forgot': 'forgot',
			'click #cancel': 'cancel',
			'click #send': 'send'
		},
		
		form: function(){	
			var output= {};
			output.email= 'asgasd';	
			output.password= $('#password').val();	
			return output;
		},
		
		login: function(){
			this.model= new mLogin();
			Backbone.BasicAuth.set($("input#email").val(), $("input#password").val());
			var self= this;
			this.model.save({}, {
				success: function(model, response){
					self.trigger("login", response)
				},
				error: function(model, response){
					var message= 'Login was unsuccessful, please try again.';
					vAlerts.add('error', message, '1', '');
				}
			});
		},
		
		session: function(response){
			
			//start session
			var user= JSON.stringify(response);
			/** CHECK FOR LOCAL STORAGE GOES HERE **/
			localStorage.setItem("user", user);
			var data= localStorage.getItem("user");
			var output= $.parseJSON(data);
			mUser.set(output);
			//update views: me tab, login, register, profile
			this.render(); 	
		},
		
		logout: function(){
			console.log(mUser);
			localStorage.removeItem("user");
			mUser.clear();
			this.render();
			vAlerts.add('complete', 'You have been logged out successfully.', '1', '');	
			console.log(mUser);	
		},
		
		forgot: function(){
			var compiled= _.template(tForgot, {});
			this.$el.html(compiled);
			return compiled;	
		},
		
		cancel: function(){
			this.render();	
		},
		
		send: function(){
			var message= _.template(tPassword, {password: 123, email: $('#email').val()})
			var email= new mEmail({recipient_email: $('#email').val(), subject: 'Your Phourus Password', message: message});
			email.save({
				success: function(){
					
				},
				error: function(){
					vAlerts.add('message', 'Password could not be sent.', '1', '');
				}
			})	
		},
		
		render: function(){
			var data= {};
			var compiled= _.template(tLogin, data);
			if(!_.isUndefined(mUser.get("token"))){
				if(!mUser.expired()){
					compiled= _.template(tLogout, mUser.toJSON());
				}
			}
			this.$el.html(compiled);
			return compiled;
		}
	});
	return vLogin;
});