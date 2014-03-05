<?php 

class qSocialTest extends PHPUnit_Framework_TestCase
{
	# views
	public function testviews(){
		// all views by user
		$params= array();
    $params['viewer_id']= 1;
	  $query= sprintf("SELECT * FROM `%s` WHERE viewer_id = %d LIMIT 0, 20;", TABLE_VIEWS, $params['viewer_id']);
		$this->assertEquals($query, qSocial::views($params));
	  
	  // all views of user
	  $params= array();
    $params['user_id']= 1;
	  $query= sprintf("SELECT * FROM `%s` WHERE user_id = %d LIMIT 0, 20;", TABLE_VIEWS, $params['user_id']);
		$this->assertEquals($query, qSocial::views($params));
		
	  // all views of post
	  $params= array();
    $params['post_id']= 1;
	  $query= sprintf("SELECT * FROM `%s` WHERE post_id = %d LIMIT 0, 20;", TABLE_VIEWS, $params['post_id']);
		$this->assertEquals($query, qSocial::views($params));
		
		// all views of org
		$params= array();
    $params['org_id']= 1;
	  $query= sprintf("SELECT * FROM `%s` WHERE org_id = %d LIMIT 0, 20;", TABLE_VIEWS, $params['org_id']);
		$this->assertEquals($query, qSocial::views($params));
	}
	
  # thumbs
	public function testthumbs(){
	  // all thumbs by user
		$params= array();
    $params['user_id']= 1;
	  $query= sprintf("SELECT * FROM `%s` WHERE user_id = %d;", TABLE_THUMBS, $params['user_id']);
		$this->assertEquals($query, qSocial::thumbs($params));
	  
	  // all thumbs for post
	  $params= array();
    $params['post_id']= 1;
	  $query= sprintf("SELECT * FROM `%s` WHERE post_id = %d;", TABLE_THUMBS, $params['post_id']);
		$this->assertEquals($query, qSocial::thumbs($params));
	}
	
  # comments
	public function testcomments(){
		// post
		$params= array();
    $params['post_id']= 1;
	  $query= sprintf("SELECT * FROM `%s` WHERE post_id = %d;", TABLE_COMMENTS, $params['post_id']);
		$this->assertEquals($query, qSocial::comments($params));
	}
	
	# follows
	public function testfavorites(){
	  // user_id + target_id
		$params= array();
    $params['user_id']= 1;
    $params['target_id']= 2;
	  $query= sprintf("SELECT * FROM `%s` WHERE user_id = %d AND target_id = %d;", TABLE_FAVORITES, $params['user_id'], $params['target_id']);
		$this->assertEquals($query, qSocial::favorites($params));
		
	  // target_id
		$params= array();
    $params['target_id']= 1;
	  $query= sprintf("SELECT * FROM `%s` WHERE target_id = %d;", TABLE_FAVORITES, $params['target_id']);
		$this->assertEquals($query, qSocial::favorites($params));
		
		// user_id
		$params= array();
    $params['user_id']= 1;
	  $query= sprintf("SELECT * FROM `%s` WHERE user_id = %d;", TABLE_FAVORITES, $params['user_id']);
		$this->assertEquals($query, qSocial::favorites($params));
		
		// missing
		$this->assertFalse(qSocial::favorites(array()));
	}
}

?>