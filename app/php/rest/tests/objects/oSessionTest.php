<?php

require_once '../classes/objects/oSession.php';

class oSessionTest extends PHPUnit_Framework_TestCase
{
  public function testget(){
  		
  }	
  
  public function testcreate(){
    
  }
  
  public function testdelete(){
    
  }
  
  public function testauth(){
    
  }
  
  public function testlogin(){
		// True
		$user= 'dcruz@ymail.com';
		$pass= 'phourus';
		$result= oSession::login($user, $pass);
		//$this->assertTrue($result);
		
		// False
		$user= 'dcruz@gmail.com';
		$pass= 'phourus';
		$result= oSession::login($user, $pass);
		//$this->assertFalse($result);
	}
}

?>