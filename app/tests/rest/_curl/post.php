<?php

class postTest extends PHPUnit_Framework_TestCase
{

  
	public function __construct(){
		$ENV= 'local';
		if($ENV== 'dev'){
			$this->base= 'https://dev.phourus.com/rest/';	
		}else if($ENV== 'prod'){
			$this->base= 'https://phourus.com/rest/';
		}else{
			$this->base= 'http://phourus.local:8888/rest/';
		}	
	} 
	
	public function result($url, $options= null){ 
  	$headers= array();
  	$ch= curl_init($this->base.$url);
  	
  	if($options != null){ extract($options); }  	
  	if(isset($auth)){ $headers= array("Authentication: Basic $auth"); }

    curl_setopt($ch, CURLOPT_POST, TRUE);
    curl_setopt($ch, CURLOPT_POSTFIELDS, array());
  	curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
		curl_setopt ($ch, CURLOPT_RETURNTRANSFER, true);
		$result = curl_exec($ch);
		return json_decode($result, true);
	}
	
	public function setUp(){ }
	public function tearDown(){ }

	public function testsession_post(){
		// Wrong: ZGF2aWRjcnV6QGdtYWlsLmNvbTpwaG91cnVz
    // Right: ZGNydXpAeW1haWwuY29tOnBob3VydXM=
    
    // Fail
		$options= array();
		$options['auth']= 'ZGF2aWRjcnV6QGdtYWlsLmNvbTpwaG91cnVz';
		$options['method']= 'POST';
		$r= $this->result("session/", $options);
		//$this->assertFalse($r);
		
    // Pass
		$options= array();
		$options['auth']= 'ZGNydXpAeW1haWwuY29tOnBob3VydXM=';
		$options['method']= 'POST';
		$r= $this->result("session/", $options);
		/*$this->assertTrue(is_array($r));
		$this->assertTrue(isset($options['token']));
		$this->assertTrue(isset($options['user_id']));
		$this->assertTrue(isset($options['expires']));
		$this->assertTrue($options['expires'] != "0000-00-00 00:00:00");	*/	
	}
	
	public function testemail_post(){
		$path= $this->base.'email';
	}
}

?>