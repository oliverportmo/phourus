var db= require('../db.js');

exports.post = function(model){
  db.posts.save(model);
  return db;
}

exports.user = function(model){
  db.users.save(model);
  return model;
}

exports.org = function(model){
  db.orgs.save(model);
  return model;
}

// Posts
exports.thumb = function(model){
  db.posts.thumbs.save(model);
  return model;
}

exports.comment = function(model){
  db.posts.comments.save(model);
  return model;
}

exports.tags = function(model){
  db.posts.tags.save(model);
  return model;
}

// Users
exports.view = function(model){
  db.users.views.save(model);
  return model;
}

exports.follow = function(model){
  db.users.follows.save(model);
  return model;
}

// Orgs
exports.clout = function(model){
  db.orgs.clout.save(model);
  return model;
}

exports.review = function(model){
  db.orgs.reviews.save(model);
  return model;
}

// ?
exports.address = function(model){
  //? db.orgs.clout.save(model);
  return model;
}

exports.pic = function(model){
  //? db.orgs.clout.save(model);
  return model;
}

exports.session = function(model){
  //? db.orgs.clout.save(model);
  return model;
}