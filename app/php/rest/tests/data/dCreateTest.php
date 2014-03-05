<?php

ini_set('display_errors', 1);
/*require_once '../../classes/data/dCreate.php';
require_once '../../classes/utility/uResult.php';
require_once '../../classes/utility/uQueries.php';
require_once '../../classes/utility/uUtilities.php';*/

class dCreateTest extends PHPUnit_Framework_TestCase
{
	
	/** CORE **/
	public function testpost(){
		$model['title']= 'test post';
		$model['element']= 'voice';
		//$single= dCreate::post($model, 'blogs');
		//var_dump($single);
	}
	
	public function testuser(){
		$model['username']= 'unituser';
		$model['password']= 'testpassword';
		$model['email']= 'test@phourus.com';
		//$user= dCreate::user($model);
		//var_dump($user);
	}
	
	public function testorg(){
  	
	}
	
	/** META **/
	public function testview(){
  	
	}
	
	public function testthumb(){
  	
	}
	
	public function testcomment(){

	}
	
	public function testfollow(){
  	
	}
	
	/** ORGS **/
	public function testclout(){
  	
	}
	
	public function testreview(){
  	
	}
	
	/** OTHER **/
	public function testaddress(){
  	
	}
	
	/** SESSION **/
	public function testsession(){
		$model['username']= 'unituser';
		$model['password']= 'testpassword';
		$model['email']= 'test@phourus.com';
		//$session= dCreate::session($model);
		//var_dump($session);
	}
}

?>