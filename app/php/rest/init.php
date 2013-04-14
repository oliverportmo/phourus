<?php 

ini_set('display_errors', 1);
ini_set('log_errors', 1);
ini_set('error_log', 'errors.txt');
error_reporting(E_ERROR | E_WARNING);


require(__DIR__.'/classes/apiCreate.php');
require(__DIR__.'/classes/apiDelete.php');
require(__DIR__.'/classes/apiRead.php');
require(__DIR__.'/classes/apiUpdate.php');
require(__DIR__.'/classes/apiQueries.php');


require(__DIR__.'/classes/objects/pSession.php');
require(__DIR__.'/classes/objects/pSingle.php');
require(__DIR__.'/classes/objects/pStream.php');
require(__DIR__.'/classes/objects/pUser.php');

require 'slim/Slim/Slim.php';
\Slim\Slim::registerAutoloader();

$DEV_DB_NAME= 'phourus:dev';
$DEV_DB_USER= 'developer';
$DEV_DB_PASS= 'phourus';

global $db;
try {  
	$db= new PDO("mysql:host=127.0.0.1;port=8889;dbname=$DEV_DB_NAME;", $DEV_DB_USER, $DEV_DB_PASS);  
}  
catch(PDOException $e) {  
    out($e->getMessage());  
}
//$db= null; 

/** GLOBAL FUNCTIONS **/
function table($type)
{
	$tables= array();	
	$tables['blogs']= 'core_blogs';
	$tables['ideas']= 'core_ideas';
	$tables['links']= 'core_links';
	$tables['events']= 'core_events';
	
	$tables['checklist']= 'earth_matters';
	$tables['calculator']= 'earth_matters';
	$tables['matters']= 'earth_matters';
	$tables['stores']= 'earth_stores';
	
	$tables['subjects']= 'mind_subjects';
	$tables['questions']= 'mind_questions';
	$tables['answers']= 'mind_answers';
	$tables['scores']= 'mind_scores';
	
	$tables['debates']= 'voice_debates';
	$tables['bills']= 'voice_bills';
	$tables['votes']= 'voice_votes';
	$tables['budget']= 'voice_budget';
	
	$tables['beliefs']= 'self_beliefs';
	$tables['quotes']= 'self_quotes';
	$tables['timeline']= 'self_timeline';
	$tables['ranks']= 'self_ranks';	
	
	$tables['stream']= 'app_stream';
	$tables['users']= 'app_users';	
	return $tables[$type];
}

?>


