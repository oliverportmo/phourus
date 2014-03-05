<?php

ini_set('display_errors', 1);
ini_set('log_errors', 1);
ini_set('error_log', 'errors.txt');
error_reporting(E_ERROR | E_WARNING);
//header("Content-Type: application/json");


/*
function phourusAutoload($class){
  $key= substr($class, 0, 1);
  $map= array();
  $map['d']= 'data';
  $map['m']= 'middleware';
  $map['o']= 'objects';
  $map['u']= 'utility';
  $file= __DIR__.'/classes/'.$map[$key].'/'.$class.'.php';
	require($file);		
}
spl_autoload_register('phourusAutoload');
*/

require 'slim/Slim/Slim.php';
\Slim\Slim::registerAutoloader();	

require_once('include.php');

global $app;
$app= new \Slim\Slim();
//$app->add(new mOut());
//$app->add(new mPermissions());

$req= $app->request();
$headers= $req->headers();
$GLOBALS['phourus_auth_id']= oSession::auth($headers);
//$GLOBALS['phourus_auth_id']= 1;
$get= $req->get();
$post= $req->post();
$put= $req->put();

function out($data){	
	global $app;
	$response = $app->response();
	
	$app->contentType('application/json');
	$code= 200;
	
	if(is_numeric($data)){
  	$code= $data;
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
$app->get('/rest/post/:query', function($query) use ($get){
	if(isset($get['count'])){
  	$out= oPost::total($get);
	}else{
  	if(!$get){ $get= array('id' => $query);	}
  	$out= oPost::get($get);
	}
	out($out);
});

$app->get('/rest/user/:query', function($query) use ($get){
	if(!$get){ $get= array('id' => $query);	}
	$out= oUser::get($get);
	out($out);
}); 

$app->get('/rest/org/:query', function($query) use ($get) {
  if(!$get){ $get= array('id' => $query);	}
  $out= oOrg::get($get);
  out($out);
});

# SOCIAL
$app->get('/rest/view/:query', function($query) use ($get){ 
	if(!$get){ $get= array('id' => $query);	}
	$out= oView::get($get);
	out($out);
});

$app->get('/rest/thumb/:query', function($query) use ($get) {
  if(!$get){ $get= array('id' => $query);	}
  $out= oThumb::get($get);
  out($out);
});

$app->get('/rest/comment/:query', function($query) use ($get) {
  if(!$get){ $get= array('id' => $query);	}
  $out= oComment::get($get);
  out($out);
});

$app->get('/rest/favorite/:query', function($query) use ($get) {
  if(!$get){ $get= array('id' => $query);	}
  $out= oFavorite::get($get);
  out($out);
});

# ORGS
$app->get('/rest/clout/:query', function($query) use ($get) {
  if(!$get){ $get= array('id' => $query);	}
  $out= oClout::get($get);
  out($out);
});

$app->get('/rest/review/:query', function($query) use ($get) {
  if(!$get){ $get= array('id' => $query);	}
  $out= oReview::get($get);
  out($out);
});

# ADDRESS
$app->get('/rest/address/:query', function($query) use ($get){ 
	if(!$get){ $get= array('id' => $query);	}
	$out= oAddress::get($get);
	out($out);
}); 

$app->get('/rest/tag/:query', function($query) use ($get){ 
	if(!$get){ $get= array('id' => $query);	}
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

# NOTIFICATIONS
$app->get('/rest/notifications/:query', function() use ($get){
  $out= oUser::notifications($get);
  out($out);
});

# HISTORY
$app->get('/rest/history/:query', function() use ($get){
  $out= oUser::notifications($get);
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

# SPECIAL 
$app->get('/rest/special/:query', function() use ($get){
  $out= dRead::special($get);
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
    
$app->post('/rest/user/', function() use ($headers, $post){
	$out= oUser::create($headers, $post);
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

$app->post('/rest/favorite/', function() use ($post){
  $out= oFavorite::create($post);
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
$app->post('/rest/pic/:id', function($id) use ($post){
  if(!isset($post['type'])){
    out('Pic type not set');
  }
  if(isset($_FILES['pic']) && $_FILES['error'] == 0){
    $upload= uUtilities::pic($_FILES['pic'], $post['type'], $id);
    out($upload);    
  }else{
    out('File not found');
  }
});

#######
# === #
# PUT #
# === # 
####### 
$app->put('/rest/post/:id', function($id) use ($put){  
	$out= oPost::update($id, $put);
	out($out);
}); 
    
$app->put('/rest/user/:id', function($id) use ($put){
	$out= oUser::update($id, $put);
	out($out);
}); 

$app->put('/rest/org/:id', function($id) use ($put){
	$out= oOrg::update($id, $put);
	out($out);
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

// X favorite

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

# PASSWORD 
$app->put('/rest/password/', function() use ($put){
  $out= dUpdate::password($put);
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

$app->delete('/rest/favorite/:id', function($id){
	$out= oFavorite::delete($id);
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