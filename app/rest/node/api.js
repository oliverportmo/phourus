//GET= GET || {};	
//GET= function(){};
//GET.prototype.
//var DB= require('./db.js');

var sys = require('sys');

  var mysql = require('mysql');
  var db= mysql.createConnection({
  	host: 'localhost', 
  	port: '8889', 
  	database: 'phourus',
  	user: 'admin',
  	password: 'phourus'
  });
  db.connect();
  
  /* 
  client.user = 'root';
  client.password = 'admin';
 
  client.connect(function(error, results) {
    if(error) {
      //console.log('Connection Error: ' + error.message);
      res.send('error');
      return;
      //exports.error;
    }
    //ClientConnectionReady(client);
  */
	exports.stream= function(req, res, next){
		db.query('SELECT * FROM `stream`;', function(error, result){
			if(error)
			{
				res.send('error');
				return;
			}
			res.send(result);
		});
	}

	exports.single= function(req, res, next){
		db.query('SELECT * FROM `stream` WHERE `id` = '+req.params.id+';', function(error, result){
			if(error)
			{
				res.send('error');
				return;
			}
			res.send(result);
		});
	}
//});
//module.exports= single;
/*
	this.stream= function(input){
		return input;
	}

	this.profile= function(input){
		return input;
	}

}

exports.PUT= function(){

	this.single= function(input){
		return input;
	}

	this.profile= function(input){
		return input;
	}
}

exports.POST= function(){

	this.single= function(input){
		return input;
	}

	this.profile= function(input){
		return input;
	}
}

exports.DELETE= function(){

	this.single= function(input){
		return input;
	}

	this.profile= function(input){
		return input;
	}
}
*/