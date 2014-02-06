var mongo = require('mongodb');
var MongoClient = mongo.MongoClient;  
MongoClient.connect("mongodb://phourus.local:27017/app/db", function(err, db) {
  if(!err) {
    console.log("We are connected");
  }else{
    console.log("Error connecting");
  }
});