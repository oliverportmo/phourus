<?php

require('init.php');

/*
function _autoload($class){
	require(__DIR__.'/classes/'.$class.'.php');		
}
*/

global $app;
$app= new \Slim\Slim();

$req= $app->request();
$get= $req->get();
$post= $req->post();
$put= $req->put();

function out($data){
	global $app;
	$response = $app->response();
	$app->contentType('application/json');
	$code= 500;
	$response->status($code);
	$response->body(json_encode($data));
}


//$authorized= authorized($token, $user);
//Token Required for all calls except:
//GET- Must handle privacy settings with token & user validation
//POST Register- Registration does not require token validation
//POST Login- Login obviously does not require token validation
//POST Email- What auth scheme to implement?

/** GET **/
$app->get('/rest/single/:id', function($id) use ($get, $resp){ 
	$single= new pSingle();
	$out= $single->get($id);
	out($out);
}); 

$app->get('/rest/user/:id', function($id) use ($get, $resp){
	$user= new pUser();
	$out= $user->get($id);
	out($out);
}); 

$app->get('/rest/stream/:query', function($query) use ($get, $app){
	$stream= new pStream();
	$out= $stream->get($get);
	out($out);
});

$app->get('/rest/session/', function() {
	//get token from x-api-key
	$session= new pSession();
	$out= $session->get($token);
	return $out;
});
    
/** POST **/          
$app->post('/rest/single/', function() use ($post, $resp){  
	$single= new pSingle();
	$out= $single->create($post);
	out($out);
}); 
    
$app->post('/rest/user/', function() use ($post, $resp){
	$user= new pUser();
	$out= $user->create($post);
	out($out);
});  
       
$app->post('/rest/login/', function() use ($post){
    $auth= $headers['Authorization'];
	$session= new pSession();
	$out= $session->create($auth);
	out($out);
}); 
      
$app->post('/rest/email/', function() use ($post){
	//$params= 'get params from post?';
	$object= new apiCreate($params);
	$out= $object->result('email');
	out($out);       
});

/** PUT **/
$app->put('/rest/single/:id', function($id) use ($put){  
	$single= new pSingle();
	$out= $single->update($id, $put);
	out($out);
}); 
    
$app->put('/rest/user/:id', function($id) use ($put){
	$user= new pUser();
	$out= $user->update($id, $put);
	out($out);
}); 

/** DELETE **/
$app->delete('/rest/single/:id', function($id){  
	$single= new pSingle();
	$out= $single->delete($id);
	out($out);
}); 
    
$app->delete('/rest/user/:id', function($id){
	$user= new pUser($id);
	$out= $user->delete($id);
	out($out);
}); 

/** RUN **/
$app->run();

?>