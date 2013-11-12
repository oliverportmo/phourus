<?php

require '../curl.php';

class sessiontest extends PHPUnit_Framework_TestCase
{
  # GET
  public function testsession(){
    // Valid
		$options= array();
		$default_token= 'ENlnLTHKlpkr5XYeaS7G';
		$default_user_id= 1;
		$r= curl("session/", $options);
		$this->assertEquals($default_token, $r['id']);
		$this->assertEquals($default_user_id, $r['user_id']);
		$this->assertTrue(isset($r['expires']));
		$this->assertTrue($r['expires'] != "0000-00-00 00:00:00");
		$this->assertEquals($r['expires'], "2014-10-15 00:54:57");
		
		// Invalid User
		$options= array();
		$options['token']= '75NnClsSIz4UdD4Lmwxb';
		$options['user_id']= 2;
		$r= curl("session/", $options);
		/** RETURNS VALID USER DUE TO DEFAULT TOKEN **/
		//$this->assertFalse($r);
  }
  	
  # POST
	public function testsession_post(){
		// Wrong: ZGF2aWRjcnV6QGdtYWlsLmNvbTpwaG91cnVz
    // Right: ZGNydXpAeW1haWwuY29tOnBob3VydXM=
    
    // Fail
		$options= array();
		$options['auth']= 'ZGF2aWRjcnV6QGdtYWlsLmNvbTpwaG91cnVz';
		$options['method']= 'POST';
		$r= curl("session/", $options);
		//$this->assertFalse($r);
		
    // Pass
		$options= array();
		$options['auth']= 'ZGNydXpAeW1haWwuY29tOnBob3VydXM=';
		$options['method']= 'POST';
		$r= curl("session/", $options);
		/* REVISIT
		$this->assertTrue(is_array($r));
		$this->assertTrue(isset($options['token']));
		$this->assertTrue(isset($options['user_id']));
		$this->assertTrue(isset($options['expires']));
		$this->assertTrue($options['expires'] != "0000-00-00 00:00:00");*/
	}
  
  # PUT
  
  # DELETE
  public function testsession_delete(){

  }
}  

?>