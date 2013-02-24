<?php
header('Content-Type: application/json');

require('db.php');
require('api.php');
$method = $_SERVER['REQUEST_METHOD'];
$url = explode("/", substr(@$_SERVER['PATH_INFO'], 1));
$vars= $_REQUEST;
$headers= apache_request_headers();
$token= $headers['x-api-key'];
$authorized= authorized($token, $user);
switch ($method) {
  
  case 'GET':
    if($url[1]== 'single')
    {  
      $record= $url[2];
      $data= get_single('stream', $record);     
      $output= json_encode($data);
      echo $output;
    }   
    if($url[1]== 'stream')
    {
      
      if($authorized['authorized']== 0){
		  echo json_encode($authorized);
		  return false;
	  }
	  $data= get_stream($vars);
      //echo json_encode($vars);
      $output= json_encode($data);
      echo $output;
    } 
    if($url[1]== 'profile')
    {
	  $record= $url[2];
      $data= get_profile($record);
      $output= json_encode($data);
      echo $output;
    }    
  break;
  case 'POST':
  	$params= file_get_contents('php://input');
  	$vars = json_decode($params, true);
    if($url[1]== 'single')
    {

    } 
    if($url[1]== 'profile')
    {

    }  
    if($url[1]== 'register')
    { 	
	  $data= post_register($vars);
      $output= json_encode($data);
      echo $output; 
    } 
    if($url[1]== 'login')
    { 	
    
      $header= $headers['Authorization'];
      $parsed= str_replace("Basic ", "", $header);
	  $decoded= base64_decode($parsed);
	  $exploded= split(':', $decoded);
	  $login= array();
	  $login['username'] = $exploded[0];
	  $login['password']= $exploded[1];
		
	  $data= post_login($vars);  
	  $output= json_encode($data);
	  echo $output;
    } 
  break;
  case 'PUT':
    if($url[1]== 'single')
    {

    } 
    if($url[1]== 'profile')
    {

    }
  break;
  case 'DELETE':
    if($url[1]== 'single')
    {

    } 
    if($url[1]== 'profile')
    {

    } 
  break;
  default:
    //HEAD, OPTIONS  
  break;
}

function authorized($token, $user){
	$output= array();
	$output['authorized']= 0;
	$output['token']= $token;
	$output['user']= $user;
	
	if('1235fgqw4tf3'== $token && $user== $user){
		$output['message']= 'Token valid';
		$output['authorized']= 1;	
	}
	return $output;	
}

/** GET **/
function get_single($type, $record)
{
  global $phourus_data;
  
  $select= array();
  $select['type']= $type;
  $select['page']= 0;
  $select['limit']= 10;
  $select['hard']= 'AND `record` = "'.mysql_real_escape_string($record).'"';
  $select['order']= 'id';
  $select['direction']= 'ASC';  
  $output= $phourus_data->select($select);
  $stream= $output['data'];
  $data= $phourus_data->merge($stream);
  return $data[0];
}

function get_stream($args)
{
  global $phourus_data;
  $data= $phourus_data->stream($args);
  return $data['data'];
}

function get_profile($record)
{
	global $phourus_data;
	$args['record']= $record;
	$data= $phourus_data->profile($args);
	return $data['data'][0];
}

/** POST **/
function post_single($args)
{
  global $phourus_data;
  $data= $phourus_data->add($args);
  return $data;
}

function post_profile($args)
{

}

function post_register($args)
{
	global $phourus_data;
	$data= $phourus_data->register($args);
	return $data['data'];
}

function post_login($args)
{
	global $phourus_data;
	$data= $phourus_data->login($args);
	return $data['data'];
}

/** PUT **/
function put_single($id, $args)
{
  global $phourus_data;
  $data= $phourus_data->edit($id, $args);
  return $data;
}

function put_profile($id, $args)
{

}

/** DELETE **/
function delete_single($id)
{
  global $phourus_data;
  $data= $phourus_data->delete($id);
  return $data;
}

function delete_profile($id)
{

}

?>