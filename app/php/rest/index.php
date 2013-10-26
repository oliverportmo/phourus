<?php

ini_set('display_errors', 1);
ini_set('log_errors', 1);
ini_set('error_log', 'errors.txt');
error_reporting(E_ERROR | E_WARNING);

/*function _autoload($class){
  var_dump($class);
	require(__DIR__.'/classes/objects/'.$class.'.php');		
}*/

require 'slim/Slim/Slim.php';
\Slim\Slim::registerAutoloader();

$base= __DIR__.'/classes/objects/';
require($base.'oAddress.php');
require($base.'oClout.php');
require($base.'oComment.php');
require($base.'oCommunity.php');
require($base.'oFollow.php');
require($base.'oInfluence.php');
require($base.'oOrg.php');
require($base.'oPermissions.php');
require($base.'oPost.php');
require($base.'oReview.php');
require($base.'oSession.php');
require($base.'oStats.php');
require($base.'oTag.php');
require($base.'oThumb.php');
require($base.'oUser.php');
require($base.'oView.php');

$base= __DIR__.'/classes/data/';
require($base.'dCreate.php');
require($base.'dDelete.php');
require($base.'dRead.php');
require($base.'dUpdate.php');

$base= __DIR__.'/classes/utility/';
require($base.'uQueries.php');
require($base.'uResult.php');
require($base.'uUtilities.php');

global $app;
$app= new \Slim\Slim();
//$app->add(new oPermissions());

$req= $app->request();
$headers= $req->headers();
$GLOBALS['phourus_auth_id']= oSession::auth($headers);
$GLOBALS['phourus_auth_id']= 1;
$get= $req->get();
$post= $req->post();
$put= $req->put();

function out($data){
	global $app;
	$response = $app->response();
	$app->contentType('application/json');
	$code= 200;
	if($data== false){
  	$code= 404;
	}
	$response->status($code);
	$response->body(json_encode($data));	
}

/** AUTHORIZATION NOTES **/ 
//$authorized= authorized($token, $user);
//Token Required for all calls except:
//GET- Must handle privacy settings with token & user validation
//POST Register- Registration does not require token validation
//POST Login- Login obviously does not require token validation
//POST Email- What auth scheme to implement?
 
#######
# === #
# GET #
# === #  
#######
$app->get('/rest/posts/:query', function() use ($get){
	$out= oPost::get($get);
	out($out);
});

$app->get('/rest/users/:query', function() use ($get){
	$out= oUser::get($get);
	out($out);
}); 

$app->get('/rest/orgs/:query', function() use ($get) {
  $out= oOrg::get($get);
  out($out);
});

# SOCIAL
$app->get('/rest/views/:query', function() use ($get){ 
	$out= oView::get($get);
	out($out);
});

// X thumbs

$app->get('/rest/comments/:query', function() use ($get) {
  $out= oComment::get($get);
  out($out);
});

$app->get('/rest/follows/:query', function() use ($get) {
  $out= oFollow::get($get);
  out($out);
});

# ORGS
$app->get('/rest/clout/:query', function() use ($get) {
  $out= oClout::get($get);
  out($out);
});

$app->get('/rest/reviews/:query', function() use ($get) {
  $out= oReview::get($get);
  out($out);
});

# ADDRESS
$app->get('/rest/address/:query', function() use ($get){ 
	$out= oAddress::get($get);
	out($out);
}); 

$app->get('/rest/tags/:query', function() use ($get){ 
	$out= oTag::get($get);
	out($out);
}); 

# INFLUENCE
$app->get('/rest/influence/:query', function() use ($get){ 
	$out= oInfluence::get($get);
	out($out);
});

# SESSION
$app->get('/rest/session/', function() use ($headers) {
	$out= oSession::get($headers);
	out($out);
});

# STATS
$app->get('/rest/stats/:query', function() use ($get){ 
	$out= oStats::stats($get);
	out($out);
});

# COMMUNITY
$app->get('/rest/community/:query', function() use ($get){ 
	$out= oCommunity::get($get);
	out($out);
});

# SCHEMA
$app->get('/rest/schema/', function() use ($get){ 
	$out= dRead::schema();
	out($out);
});

########
# ==== #
# POST #
# ==== #   
########   
$app->post('/rest/post/', function() use ($post){  
	$out= oPost::create($post);
	out($out);
}); 
    
$app->post('/rest/user/', function() use ($post){
	$out= oUser::create($post);
	out($out);
});  

$app->post('/rest/org/', function() use ($post){
	$out= oOrg::create($post);
	out($out);
});
       
# STATS  
$app->post('/rest/view/', function() use ($post){
  $out= oView::create($post);
	out($out);
});

$app->post('/rest/thumb/', function() use ($post){
  $out= oThumb::create($post);
	out($out);
});

$app->post('/rest/comment/', function() use ($post){
  $out= oComment::create($post);
	out($out);
}); 

$app->post('/rest/follow/', function() use ($post){
  $out= oFollow::create($post);
	out($out);
});

$app->post('/rest/clout/', function() use ($post){
  $out= oClout::create($post);
	out($out);
});

$app->post('/rest/review/', function() use ($post){
  $out= oReview::create($post);
	out($out);
});

$app->post('/rest/address/', function() use ($post){
  $out= oAddress::create($post);
	out($out);
});

$app->post('/rest/tag/', function() use ($post){ 
	$out= oTag::create($post);
	out($out);
}); 
 
# SESSION
$app->post('/rest/session/', function() use ($headers){
	$out= oSession::create($headers);
	out($out);
}); 

# OTHER
$app->post('/rest/email/', function() use ($post){
	//$params= 'get params from post?';
	//$object= new apiCreate($params);
	//$out= $object->result('email');
	//out($out);       
});

#######
# === #
# PUT #
# === # 
####### 
$app->put('/rest/post/:id', function($id) use ($put){  
	//$out= oPost::update($id, $put);
	//$out= oUser::relationships($id);
	//out($out);
	
}); 
    
$app->put('/rest/user/:id', function($id) use ($put){
	$out= oUser::update($id, $put);
	out($out);
}); 

$app->put('/rest/org/:id', function($id) use ($put){
	$out= oOrg::update($id, $put);
	out($put);
});

// X stats
// X community
// X view

$app->put('/rest/thumb/:id', function($id) use ($put){
	$out= oThumb::update($id, $put);
	out($out);
});

$app->put('/rest/comment/:id', function($id) use ($put){
	$out= oComment::update($id, $put);
	out($out);
});

// X follow

$app->put('/rest/clout/:id', function($id) use ($put){
	$out= oClout::update($id, $put);
	out($out);
});

$app->put('/rest/review/:id', function($id) use ($put){
	$out= oReview::update($id, $put);
	out($out);
});

$app->put('/rest/address/:id', function($id) use ($put){
	$out= oAddress::update($id, $put);
	out($out);
});

// X tag

// X session

##########
# ====== #
# DELETE #
# ====== #  
##########
$app->delete('/rest/post/:id', function($id){  
	$out= oPost::delete($id);
	out($out);
}); 
    
$app->delete('/rest/user/:id', function($id){
	$out= oUser::delete($id);
	out($out);
}); 

$app->delete('/rest/org/:id', function($id){
	$out= oOrg::delete($id);
	out($out);
}); 

// X stats 
// X community 

$app->delete('/rest/view/:id', function($id){
	$out= oView::delete($id);
	out($out);
});

$app->delete('/rest/thumb/:id', function($id){
	$out= oThumb::delete($id);
	out($out);
});

$app->delete('/rest/comment/:id', function($id){
	$out= oComment::delete($id);
	out($out);
});

$app->delete('/rest/follow/:id', function($id){
	$out= oFollow::delete($id);
	out($out);
});

$app->delete('/rest/clout/:id', function($id){
  $out= oClout::delete($id);
	out($out);
});

$app->delete('/rest/review/:id', function($id){
  $out= oReview::delete($id);
	out($out);
});

$app->delete('/rest/address/:id', function($id){
  $out= oAddress::delete($id);
	out($out);
});

$app->delete('/rest/tag/:id', function($id){ 
	$out= oTag::delete($id);
	out($out);
}); 

$app->delete('/rest/session/', function($id){
  //$out= oSession::delete($token, $user_id);
	out($out);
});

/** RUN **/
$app->run();

?>