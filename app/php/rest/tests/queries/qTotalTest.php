<?php 

class qTotalTest extends PHPUnit_Framework_TestCase
{
	# comments
	public function testcomments(){
    // post
    $params= array();
    $params['post_id']= 8;
    $where= sprintf("AND %s.id = %d", TABLE_POSTS, $params['post_id']);
    $query= sprintf("SELECT COUNT(*) AS total FROM `%s`, `%s` WHERE %s.id = %s.post_id %s;", TABLE_POSTS, TABLE_COMMENTS, TABLE_POSTS, TABLE_COMMENTS, $where);
    $this->assertEquals($query, qTotal::comments($params));
    
    // user
    $params= array();
    $params['user_id']= 7;
    $where= sprintf("AND %s.user_id = %d", TABLE_POSTS, $params['user_id']);
    $query= sprintf("SELECT COUNT(*) AS total FROM `%s`, `%s` WHERE %s.id = %s.post_id %s;", TABLE_POSTS, TABLE_COMMENTS, TABLE_POSTS, TABLE_COMMENTS, $where);
    $this->assertEquals($query, qTotal::comments($params));
    
    // int
    $user_id= 7;
    $this->assertFalse(qTotal::comments($user_id));
	}
	
	# thumbs
	public function testthumbs(){
	 // post
	 $params= array();
	 $params['post_id']= 20;
   $where= sprintf("WHERE post_id = %d", $params['post_id']);
	 $query= sprintf("SELECT COUNT(*) AS total, SUM(positive) AS positive FROM `%s` %s;", TABLE_THUMBS, $where);	  
	 $this->assertEquals($query, qTotal::thumbs($params));
	 
	 // user
	 $params= array();
	 $params['user_id']= 17;
   $where= sprintf("WHERE %s.id = %s.post_id AND %s.user_id = %d", TABLE_POSTS, TABLE_THUMBS, TABLE_POSTS, $params['user_id']);
	 $query= sprintf("SELECT COUNT(*) AS total, SUM(positive) AS positive FROM `%s`, `%s` %s;", TABLE_POSTS, TABLE_THUMBS, $where);
	 $this->assertEquals($query, qTotal::thumbs($params));
	 
	 // int
   $user_id= 7;
   $this->assertFalse(qTotal::thumbs($user_id));
	}
	
	# views
	public function testviews(){
	 // user
	 $params= array();
	 $params['user_id']= 9;
	 $where= sprintf("WHERE %s.id = %s.post_id AND %s.user_id = %d", TABLE_POSTS, TABLE_VIEWS, TABLE_POSTS, $params['user_id']);
	 $query= sprintf("SELECT COUNT(*) AS total FROM `%s`, `%s` %s;", TABLE_POSTS, TABLE_VIEWS, $where);
	 $this->assertEquals($query, qTotal::views($params));
	 
	 // post
	 $params= array();
	 $params['post_id']= 10;
	 $where= sprintf("WHERE %s.post_id = %d", TABLE_VIEWS, $params['post_id']);
	 $query= sprintf("SELECT COUNT(*) AS total FROM `%s` %s;", TABLE_VIEWS, $where);
	 $this->assertEquals($query, qTotal::views($params));
	} 
	
	# favorites
  public function testfavorites(){
	 $user_id= 5;
	 $query= sprintf("SELECT AVG(%s.influence) AS average, COUNT(%s.influence) AS total FROM `%s`, `%s` WHERE %s.id = %s.user_id AND %s.target_id = %d;", TABLE_USERS, TABLE_USERS, TABLE_USERS, TABLE_FAVORITES, TABLE_USERS, TABLE_FAVORITES, TABLE_FAVORITES, $user_id);
	 $this->assertEquals($query, qTotal::favorites($user_id));
	}
	
	# posts
	public function testposts(){
    $user_id= 4;
    $query= sprintf("SELECT COUNT(*) AS total FROM `%s` WHERE user_id = %d;", TABLE_POSTS, $user_id);
    $this->assertEquals($query, qTotal::posts($user_id));
	} 
	
	# community
	public function testcommunity(){
	  $org_id= 2;
  	$query= sprintf("SELECT type, COUNT(*) AS total FROM `%s` WHERE org_id = %d GROUP BY type;", TABLE_MEMBERS, $org_id);
  	$this->assertEquals($query, qTotal::community($org_id));
	}
}

?>