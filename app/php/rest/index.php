<?php

require('init.php');

function _autoload($class){
	require(__DIR__.'/classes/'.$class.'.php');		
}

$app= new \Slim\Slim();
$res = $app->response();
$res['Content-Type'] = 'application/json';

//$authorized= authorized($token, $user);
//Token Required for all calls except:
//GET- Must handle privacy settings with token & user validation
//POST Register- Registration does not require token validation
//POST Login- Login obviously does not require token validation
//POST Email- What auth scheme to implement?

/** GET **/ 
$app->get('/rest/single/:id', function($id){ 
	$object= new apiRead($id);
	$out= $object->result('single');
	out($out);
}); 

$app->get('rest/profile/:id', function($id){
	$object= new apiRead($id);
	$out= $object->result('profile');
	out($out);
}); 

$app->get('/rest/stream/:query', function(){
	//$params= 'get query params?';
	$object= new apiRead($params);
	$out= $object->result('stream');
	out($out);
});
    
/** POST **/          
$app->post('rest/single/', function(){  
	//$params= 'get params from post?';
	$object= new apiCreate($params);
	$out= $object->result('single');
	out($out);
}); 
    
$app->post('rest/profile/', function(){
    //$params= 'get params from post?';
	$object= new apiCreate($params);
	$out= $object->result('profile');
	out($out);
});  
       
$app->post('rest/session/', function(){
    $auth= $headers['Authorization'];
    $params= decode($auth);
	$object= new apiCreate($params);
	$out= $object->result('session');
	out($out);
}); 
      
$app->post('rest/email/', function(){
	//$params= 'get params from post?';
	$object= new apiCreate($params);
	$out= $object->result('email');
	out($out);       
});

/** PUT **/
$app->put('rest/single/:id', function($id){  
	//$params= 'get params from put?';
	$object= new apiUpdate($id, $params);
	$out= $object->result('single');
	out($out);
}); 
    
$app->put('rest/profile/:id', function($id){
	$params= 'get params from put?';
	$object= new apiUpdate($id, $params);
	$out= $object->result('profile');
	out($out);
}); 

/** DELETE **/
$app->delete('rest/single/:id', function($id){  
	$object= new apiDelete($id);
	$out= $object->result('single');
	out($out);
}); 
    
$app->delete('rest/profile/:id', function($id){
	$object= new apiDelete($id);
	$out= $object->result('profile');
	out($out);
}); 

/** RUN **/
$app->run();

?>