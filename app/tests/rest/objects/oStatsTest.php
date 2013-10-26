<?php

require_once '../../../php/rest/classes/objects/oStats.php';
require_once '../../../php/rest/classes/data/dRead.php';
require_once '../../../php/rest/classes/utility/uResult.php';
require_once '../../../php/rest/classes/utility/uQueries.php';

class oStatsTest extends PHPUnit_Framework_TestCase
{
	
	public function teststats(){
		/**/
	}
	
	public function testpost(){
  	$post_id= "1";
		$result= oStats::post($post_id);
		$this->assertEquals(4, $result['comments']);
		$this->assertEquals(3, $result['thumbs']);
		$this->assertEquals(2, $result['positive']);
		$this->assertEquals(3, $result['views']);
	}
	
	public function testuser(){
		/*
		$user_id= "1";
		$result= oStats::user($user_id);
		$this->assertEquals(2, $result['comments']);
		$this->assertEquals(2, $result['thumbs']);
		$this->assertEquals(1, $result['positive']);
		$this->assertEquals(2, $result['views']);*/
	}

	public function testorg(){
		/*
		$org_id= "1";
		$result= oStats::org($org_id);
		$this->assertEquals(2, $result['comments']);
		$this->assertEquals(2, $result['thumbs']);
		$this->assertEquals(1, $result['positive']);
		$this->assertEquals(2, $result['views']);*/
	}
}

?>