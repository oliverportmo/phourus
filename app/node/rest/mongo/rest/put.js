var db= require('./mongo/db.js');

exports.post = function(id, model){
  db.posts.update({id: id}, model);
  return id;
}

exports.user = function(id, model){
  db.users.update({id: id}, model);
  return id;
}

exports.org = function(id, model){
  db.orgs.update({id: id}, model);
  return id;
}

// Posts
exports.thumb = function(id, model){
  db.posts.thumbs.update({id: id}, model);
  return id;
}

exports.comment = function(id, model){
  db.posts.comments.update({id: id}, model);
  return id;
}

// Users

// Orgs
exports.clout = function(id, model){
  db.orgs.clout.update({id: id}, model);
  return id;
}

exports.review = function(id, model){
  db.orgs.reviews.update({id: id}, model);
  return id;
}

// ?
exports.address = function(id, model){
  //db.orgs.update({id: id}, model);
  return id;
}

exports.pic = function(id, model){
  //db.orgs.update({id: id}, model);
  return id;
}