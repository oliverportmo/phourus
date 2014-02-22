<?php

require '../curl.php';

class notificationtest extends PHPUnit_Framework_TestCase
{
  public function testnotification(){
    // Community
		$org_id= '1';
		$r= curl("notification/?org_id=$org_id");
		/** COMMUNITY NOT AVAILABLE **/
		//$this->assertEquals($org_id, $r['org_id']);
  }
}
  
?>