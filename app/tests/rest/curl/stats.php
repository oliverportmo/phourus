<?php

require '../curl.php';

class statstest extends PHPUnit_Framework_TestCase
{
  # GET
	public function teststats(){	
		// Post
		$post_id= 1;
		$r= curl("stats/?post_id=$post_id");
		$this->assertEquals(5, count($r));
		$this->assertEquals(4, $r['comments']);
		$this->assertEquals(3, $r['thumbs']);
		$this->assertEquals(66, $r['popularity']);
		$this->assertEquals(2, $r['positive']);
		$this->assertEquals(3, $r['views']);
		
		// User
		$user_id= 1;
		$r= curl("stats/?user_id=$user_id");
		$this->assertEquals(7, count($r));
		
		$totals= $r;
		$this->assertEquals($totals['comments'], 4);
		$this->assertEquals($totals['thumbs'], 4);
		$this->assertEquals($totals['positive'], 2);
		$this->assertEquals($totals['views'], 3);
		
		$posts= $r['posts'];
		$this->assertEquals($posts['beliefs'], 1);
		$this->assertEquals($posts['debates'], 2);
		$this->assertEquals($posts['quotes'], 3);
		
		$followers= $r['followers'];
		$this->assertEquals($followers['average'], 51);
		$this->assertEquals($followers['total'], 4);
		
		// Org
		$org_id= 1;
		$r= curl("stats/?org_id=$org_id");
		/** ORG STATS UNAVAILABLE **/
		$this->assertEquals($r['views'], 2);
		$this->assertEquals($r['thumbs'], 2);
		$this->assertEquals($r['comments'], 2);
		$this->assertEquals(count($r), 3);
	}	
}	

?>