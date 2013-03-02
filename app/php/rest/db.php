<?php 

ini_set('display_errors', 1);
ini_set('log_errors', 1);
ini_set('error_log', 'errors.txt');
error_reporting(E_ERROR | E_WARNING);
$server= $_SERVER['SERVER_NAME'];	

$GLOBALS['PHOURUS_DB_NAME']= 'phourus:dev';
$GLOBALS['PHOURUS_DB_USER']= 'developer';
$GLOBALS['PHOURUS_DB_PASS']= 'phourus';

define('ROOT', $_SERVER['DOCUMENT_ROOT']);
$subdomain= array_shift(explode(".",$_SERVER['HTTP_HOST']));
if($subdomain== 'm' || $subdomain== 'mobile')
{
	define('THEME', 'mobile');
}else{
	define('THEME', 'web');
}

function connect()
{	
	$output= array();
	$output['error']= 0;
		
	$database= '';
	$database= $GLOBALS['PHOURUS_DB_NAME'];
	$connect= @mysql_connect("localhost", $GLOBALS['PHOURUS_DB_USER'], $GLOBALS['PHOURUS_DB_PASS']);
	if(!$connect)
	{
		$output['data']= 'Could not connect to database.';
		$output['debug']= '';
		$output['error']= 1;
		return $output;
	}
	
	$select= @mysql_select_db($database);
	if(!$select)
	{
		$output['data']= 'Could not select database.';
		$output['debug']= $database;
		$output['error']= 1;
		return $output;	
	}
	
	$output['data']= $connect;
	$output['debug']= '';
	$output['error']= 0;
	return $output;	
}
connect();

?>