<?php

require_once '../classes/objects/oReview.php';

class oReviewTest extends PHPUnit_Framework_TestCase
{
  public function testget(){
    // reviews for org
  	$params= array();
		$params['org_id']= 1;
		$r= oReview::get($params);
		$this->assertEquals(count($r), 5);

		$this->assertEquals($r[0]['review']['org_id'], $params['org_id']);
		$this->assertEquals($r[1]['review']['org_id'], $params['org_id']);
		$this->assertEquals($r[2]['review']['org_id'], $params['org_id']);
		$this->assertEquals($r[3]['review']['org_id'], $params['org_id']);
		$this->assertEquals($r[4]['review']['org_id'], $params['org_id']);
		
		// reviews by user
		$params= array();
		$params['user_id']= 1;
		$r= oReview::get($params);
		$this->assertEquals(count($r), 1);
		
		$this->assertEquals($r[0]['review']['id'], 3);
		$this->assertEquals($r[0]['review']['org_id'], 1);
		$this->assertEquals($r[0]['review']['user_id'], $params['user_id']);
		$this->assertEquals($r[0]['review']['title'], 'Good but needs improvement');
		$this->assertEquals($r[0]['review']['rating'], 3);
		//$this->assertEquals($r[0]['created'], "2013-09-18 10:21:19");
		//$this->assertEquals($r[0]['modified'], "2013-09-18 10:21:21");

	}
	
	public function testcreate(){
		
	}
	
	public function testupdate(){
		
	}
	
	public function testdelete(){
		
	}
}

?>