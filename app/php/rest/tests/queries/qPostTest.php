<?php 

class qPostTest extends PHPUnit_Framework_TestCase
{

	# post
	public function testpost(){ 
		$params= array();
		$params['id']= '1';
		$query= sprintf("SELECT * FROM `%s` WHERE id = %d;", TABLE_POSTS, $params['id']);
		$this->assertEquals($query, qPost::post($params));
	}
	
	# meta
	public function testpost_meta(){ 
		$params= array();
		$params['post_id']= 1;
		$params['type']= 'blogs';
		$query= sprintf("SELECT * FROM `%s` WHERE post_id = %d;", uUtilities::table($params['type']), $params['post_id']);
		$this->assertEquals($query, qPost::meta($params));
	}
	
  # tag
	public function testtag(){
	  // post
	  $params= array();
	  $params['post_id']= 7;
	  $where= sprintf("WHERE post_id = %d", $params['post_id']);
		$query= sprintf("SELECT * FROM `%s` %s;", TABLE_TAGS, $where);
		
		// id
		$params= array();
	  $params['id']= 4;
	  $where= sprintf("WHERE id = %d", $params['id']);
		$query= sprintf("SELECT * FROM `%s` %s;", TABLE_TAGS, $where);
	}
}

?>