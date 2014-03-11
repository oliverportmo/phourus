<?php

class qAuthTest extends PHPUnit_Framework_TestCase
{

	# login
  public function testlogin(){ 
		$params= array();
		$params['key']= 'email';
		$params['username']= 'testaccount@phourus.com';
		$query= sprintf("SELECT id FROM `%s` WHERE %s = '%s';", TABLE_USERS, $params['key'], $params['username']);
		$this->assertEquals($query, qAuth::login($params));
	}
	
	# hash
	public function testhash(){	
    $user_id= 2;		
		$query= sprintf("SELECT hash FROM `%s` WHERE user_id = %d;", TABLE_PASSWORDS, $user_id);
		$this->assertEquals($query, qAuth::hash($user_id));
	}
	
	# session
	public function testsession(){ 
		$params= array();
		$params['id']= '98NASDF8RQ0ASF';
		$params['user_id']= 2;
		$query= sprintf("SELECT * FROM `%s` WHERE id = '%s' AND user_id = %d;", TABLE_TOKENS, $params['id'], $params['user_id']);
		$this->assertEquals($query, qAuth::session($params));
	}
	
	# session_auth
	public function testsession_auth(){
  	
	}
	
	# session_create
	public function testsession_create(){ 
		$params= array();
		$params['id']= '98NASDF8RQ0ASF';
		$params['expires']= uUtilities::expires();
		$params['user_id']= 'testaccount@phourus.com';
		$query= sprintf("INSERT INTO `%s` (`id`, `expires`, `user_id`) VALUES ('%s', '%s', %d);", TABLE_TOKENS, $params['id'], $params['expires'], $params['user_id']);
		$this->assertEquals($query, qAuth::session_create($params));
	}
}

?>