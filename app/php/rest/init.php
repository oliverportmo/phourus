<?php 

ini_set('display_errors', 1);
ini_set('log_errors', 1);
ini_set('error_log', 'errors.txt');
error_reporting(E_ERROR | E_WARNING);

require(__DIR__.'/classes/apiCreate.php');
require(__DIR__.'/classes/apiDelete.php');
require(__DIR__.'/classes/apiRead.php');
require(__DIR__.'/classes/apiUpdate.php');

require('queries.php');
require 'slim/Slim/Slim.php';
\Slim\Slim::registerAutoloader();

$DEV_DB_NAME= 'phourus:dev';
$DEV_DB_USER= 'developer';
$DEV_DB_PASS= 'phourus';

global $db;
try {  
	$db= new PDO("mysql:host=127.0.0.1;port=8889;dbname=$DEV_DB_NAME;", $DEV_DB_USER, $DEV_DB_PASS);  
	foreach($Q as $key => $value){
		//$Q[$key]= $db->prepare($value);	
	}
}  
catch(PDOException $e) {  
    out($e->getMessage());  
}
//$db= null; 

/** GLOBAL FUNCTIONS **/
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

function out($data){
	//set header to response $code
	echo json_encode($data);
}

function table($type)
{
	$tables= array();
	$tables['stream']= 'app_stream';
	$tables['blogs']= 'core_blogs';
	$tables['ideas']= 'core_ideas';
	$tables['links']= 'core_links';
	$tables['events']= 'core_events';
	
	$tables['matters']= 'voice_matters';
	
	$tables['subjects']= 'mind_subjects';
	$tables['questions']= 'mind_questions';
	$tables['answers']= 'mind_answers';
	
	$tables['debates']= 'voice_debates';
	$tables['bills']= 'voice_bills';
	$tables['votes']= 'voice_votes';
	
	$tables['beliefs']= 'faith_beliefs';
	$tables['timeline']= 'faith_timeline';	
	
	$tables['users']= 'app_users';	
	return $tables[$type];
}

?>


