<?php

require_once '../../../php/rest/classes/objects/oUser.php';

class oUserTest extends PHPUnit_Framework_TestCase
{
	
	public function testget(){
  	
	}
	
	public function testcreate(){
  	
	}
	
	public function testupdate(){
  	
	}
	
	public function testdelete(){
  	
	}
	
	public function teststats(){
  	
	}
	
	public function testrelationships(){
  	$user_id= "1";
		$result= oUser::relationships($user_id);
		$this->assertEquals(count($result), 3);
	}
	
	public function testcommas(){
  	
	}
	
	public function testrecent(){
  	
	}
	
}

?>