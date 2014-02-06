var restify = require('restify');

function get(req, res, next) {
  var R= require('./mongo/rest/get.js');
  var out = R.post(req.params[0]);
  res.send(out);
}

function post(req, res, next) {
  var model = req.body;
  var C= require('./mongo/rest/post.js');
  var out = C.post(model);
  res.send(out);
}

function put(req, res, next) {
  var U= require('./mongo/rest/put.js');
  var out = U.post(req.params[0], model);
  res.send(out);
}

function del(req, res, next) {
  var D= require('./mongo/rest/del.js');
  var out = D.post(req.params[0]);
  res.send(out);
}

var server = restify.createServer();
server.use(restify.bodyParser({ mapParams: false }));

/** READ **/
server.get('/api/post/:id', get);
server.get('/api/user/:id', get);
server.get('/api/org/:id', get);
server.get('/api/session/:id', get);
server.get('/api/stats/:id', get);
server.get('/api/community/:id', get);

 /** CREATE **/
server.post('/api/post', post);
server.post('/api/user', post);
server.post('/api/org', post);
server.post('/api/view', post);
server.post('/api/thumb', post);
server.post('/api/comment', post);
server.post('/api/follow', post);
server.post('/api/clout', post);
server.post('/api/review', post);
server.post('/api/address', post);
server.post('/api/tag', post);
server.post('/api/session', post);
server.post('/api/pic', post);

/** UPDATE **/
server.put('/api/post/:id', put);
server.put('/api/user/:id', put);
server.put('/api/org/:id', put);
server.put('/api/thumb/:id', put);
server.put('/api/comment/:id', put);
server.put('/api/clout/:id', put);
server.put('/api/review/:id', put);
server.put('/api/address/:id', put);
server.put('/api/pic/:id', put);

/** DELETE **/
server.del('/api/post/:id', del);
server.del('/api/user/:id', del);
server.del('/api/org/:id', del);
server.del('/api/view/:id', del);
server.del('/api/thumb/:id', del);
server.del('/api/comment/:id', del);
server.del('/api/follow/:id', del);
server.del('/api/clout/:id', del);
server.del('/api/review/:id', del);
server.del('/api/address/:id', del);
server.del('/api/tag/:id', del);
server.del('/api/session/:id', del);

server.listen(4321, '127.0.0.1', function() {
  //sys.puts('%s listening at %s', server.name, server.url);
  console.log('Restify Server Started');
});