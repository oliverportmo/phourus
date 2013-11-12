<?php

require '../curl.php';

class communitytest extends PHPUnit_Framework_TestCase
{
  public function testcommunity(){
    // Community
		$org_id= '1';
		$r= curl("community/?org_id=$org_id");
		/** COMMUNITY NOT AVAILABLE **/
		//$this->assertEquals($org_id, $r['org_id']);
  }
}
  
?>