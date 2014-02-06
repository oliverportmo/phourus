var db= require('./mongo/db.js');

exports.post = function(id){
  db.posts.find({id: id});
  return id;
}

exports.user = function(id){
  db.users.find({id: id});
  return id;
}

exports.org = function(id){
  db.users.find({id: id});
  return id;
}

exports.session = function(id){
  db.users.find({id: id});
  return id;
}

exports.stats = function(id){
  db.users.find({id: id});
  return id;
}

exports.community = function(id){
  db.users.find({id: id});
  return id;
}