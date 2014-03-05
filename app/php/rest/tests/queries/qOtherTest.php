<?php 

class qOtherTest extends PHPUnit_Framework_TestCase
{

	# address
	public function testaddress(){
    //org address
    $params= array();
    $params['org_id']= 1;
	  $query= sprintf("SELECT * FROM `%s` WHERE org_id = %d;", TABLE_ADDRESS, $params['org_id']);
		$this->assertEquals($query, qOther::address($params));
		
		//user address
		$params= array();
    $params['user_id']= 1;
	  $query= sprintf("SELECT * FROM `%s` WHERE user_id = %d;", TABLE_ADDRESS, $params['user_id']);
		$this->assertEquals($query, qOther::address($params));
		
		//address id
		$params= array();
		$params['id']= 1;
	  $query= sprintf("SELECT * FROM `%s` WHERE id = %d;", TABLE_ADDRESS, $params['id']);
		$this->assertEquals($query, qOther::address($params));
	}
	
	# influence
	public function influence(){
  	// post
  	$query= sprintf("SELECT influence FROM `%s` WHERE id = %d;", TABLE_POSTS, $params['post_id']);
  	
  	// user
  	$query= sprintf("SELECT influence FROM `%s` WHERE id = %d;", TABLE_USERS, $params['user_id']);

  	// org
    $query= sprintf("SELECT influence FROM `%s` WHERE id = %d;", TABLE_ORGS, $params['org_id']);
	}	
}

?>