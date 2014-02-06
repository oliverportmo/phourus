var db= require('./mongo/db.js');

exports.post = function(id){
  db.posts.remove({id: id});
  return id;
}

exports.user = function(id){
  db.users.remove({id: id});
  return id;
}

exports.org = function(id){
  db.orgs.remove({id: id});
  return id;
}

// Posts
exports.thumb = function(id){
  db.posts.thumbs.remove({id: id});
  return id;
}

exports.comment = function(id){
  db.posts.comments.remove({id: id});
  return id;
}

exports.tag = function(id){
  db.posts.tags.remove({id: id});
  return id;
}

// Users
exports.view = function(id){
  db.users.views.remove({id: id});
  return id;
}

exports.follow = function(id){
  db.users.follows.remove({id: id});
  return id;
}

// Orgs
exports.clout = function(id){
  db.orgs.clout.remove({id: id});
  return id;
}

exports.review = function(id){
  db.orgs.reviews.remove({id: id});
  return id;
}

// ?
exports.address = function(id){
  //db.orgs.remove({id: id});
  return id;
}

exports.session = function(id){
  //db.orgs.remove({id: id});
  return id;
}