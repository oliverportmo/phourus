define(['jquery', 'underscore', 'backbone', 'text!../../templates/login.html', 'text!../../templates/logout.html', 'models/login', 'models/user', 'views/alerts'], function($, a, b, tLogin, tLogout, mLogin, mUser, vAlerts){
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
			'click #logout': 'logout'
		},
		
		form: function(){	
			var output= {};
			output.email= 'asgasd';	
			output.password= $('#password').val();	
			return output;
		},
		
		login: function(){
			this.model= new mLogin({email: $("input#email").val(), password: $("input#password").val()});
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
		
		logout: function(){
			console.log(mUser);
			localStorage.removeItem("user");
			mUser.clear();
			this.render();
			vAlerts.add('complete', 'You have been logged out successfully.', '1', '');	
			console.log(mUser);	
		},
		
		session: function(response){
			console.log(response);
			//start session
			var user= JSON.stringify(response);
			localStorage.setItem("user", user);
			var data= localStorage.getItem("user");
			var output= $.parseJSON(data);
			mUser.set(output);
			//update views: me tab, login, register, profile
			this.render(); 	
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