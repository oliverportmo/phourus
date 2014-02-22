<?php

class curlTest extends PHPUnit_Framework_TestCase
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
  	
  	if($options != null){
    	extract($options);
  	}  	
  	if(isset($auth)){
      $headers= array("Authentication: Basic $auth");
  	}
  	if(isset($token) && isset($user_id)){
    	$headers= array("x-api-key: $token", "from: $user_id");
  	}
  	if(isset($method) && $method == 'POST'){
      curl_setopt($ch, CURLOPT_POST, TRUE);
      curl_setopt($ch, CURLOPT_POSTFIELDS, array());
    }else{
      curl_setopt($ch, CURLOPT_POST, FALSE);
    }
  	curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
		curl_setopt ($ch, CURLOPT_RETURNTRANSFER, true);
		$result = curl_exec($ch);
		return json_decode($result, true);
	}
	
	public function setUp(){ }
	public function tearDown(){ }
 
	public function testsingle_delete(){
		$path= $this->base.'single/:id';
	}
     
  public function testuser_delete(){
	  $path= $this->base.'user/:id';
  }
}

?>