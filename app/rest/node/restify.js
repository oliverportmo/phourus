var API= require('./api.js');
var restify = require('restify');

function respond(req, res, next) {
  res.send(req.url);
}

var server = restify.createServer();

/** READ **/
server.get('/api/single/:id', API.single);
server.get('/api/profile/:id', respond);
server.get('/api/stream', API.stream);

/** CREATE **/
server.post('/api/single', respond);
server.post('/api/profile', respond);

/** UPDATE **/
server.put('/api/single/:id', respond);
server.put('/api/profile/:id', respond);

/** DELETE **/
server.del('/api/single/:id', respond);
server.del('/api/profile/:id', respond);

server.listen(4321, function() {
  //sys.puts('%s listening at %s', server.name, server.url);
});