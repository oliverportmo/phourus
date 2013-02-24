var http = require("http"),
    url = require("url"),
    path = require("path"),
    fs = require("fs")
    port = process.argv[2] || 9149;
 
http.createServer(function(request, response) {
 
  var uri = ''
    , filename = path.join(process.cwd(), uri);
  fs.exists(filename, function(exists) {
    if(!exists) {
      response.writeHead(404, {"Content-Type": "text/plain"});
      response.write("404 Not Found\n");
      response.end();
      return;
    }
 
  if (fs.statSync(filename).isDirectory()) filename += '/index.html';
 
    fs.readFile(filename, "binary", function(err, file) {
      if(err) {        
        response.writeHead(500, {"Content-Type": "text/plain"});
        response.write(err + "\n");
        response.end();
        return;
      }
 
      response.writeHead(200);
      response.write(file, "binary");
      response.end();
    });
  });
}).listen(parseInt(port, 10));
 
console.log("Static file server running at\n  => http://localhost:" + port + "/\nCTRL + C to shutdown");

/** 

var util = require('util');    
var http = require('http');
var sys = require('sys'); 
var url = require('url');
//var dispatcher= require('./dispatcher.js');
console.log('starting server'); 
/*process.on('uncaughtException', function(err) {
  console.log(err);
});*


//    
http.createServer(function (req, res) {
  //
  //
  
    //var mysql = require('mysql').Client;
    //dispatcher.dispatch(req, res);
    
  try {   
    res.writeHead(200, {'Content-Type': 'text/plain'});
    var client= new mysql();
    res.write('html');
    res.end();   
  } catch(error) { 
    sys.puts(error);
    res.writeHead(500);
    res.end('Internal Server Error');
    //res.write(error); 
  }
  //var connection= mysql.createClient({host: 'localhost', user: 'root', password: 'admin'});
  //connection.connect();
  //var client = new db();
   
  //client.user = 'root';
  //client.password = 'admin';
 /*
  client.connect(function(error, results) {
    if(error) {
      //console.log('Connection Error: ' + error.message);
      //return;
      //exports.error;
    }
    //ClientConnectionReady(client);
  });
  //connection.end();
}).listen(4321, '127.0.0.1', function(){
  console.log('Running');
});**/