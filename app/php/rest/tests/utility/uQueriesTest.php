<?php

ini_set('display_errors', 1);
require_once '../../../php/rest/classes/utility/uQueries.php';
require_once '../../../php/rest/classes/utility/uUtilities.php';

class uQueriesTest extends PHPUnit_Framework_TestCase
{
	
  public function testposts(){ 
		$params= array();
		$params['privacy']= '1';
		$params['mode']= '1';
		$params['types']= '1';
		$params['order']= '1';
		$params['paging']= '1';
		extract($params);
		$query= "SELECT post_id, type FROM app_stream $privacy $mode $types $order $paging;";
		$this->assertEquals($query, uQueries::stream($params));
	}
	
	public function testmeta(){ 
		$params= array();
		$params['id']= '1';
		$params['type']= 'blogs';
		extract($params);
		$query= "SELECT * FROM app_stream WHERE post_id = '$id' AND type = '$type';";
		$this->assertEquals($query, uQueries::meta($params));
	}
	
	public function testpost(){ 
		$params= array();
		$params['id']= '1';
		$params['table']= 'core_blogs';
		extract($params);
		$query= "SELECT * FROM $table WHERE id = '$id';";
		$this->assertEquals($query, uQueries::post($params));
	}
		
	public function testusers(){
  	
	}
		
	public function testorgs(){
  	
	}
	
	public function testcreate(){ 
		/*$model= array();
		$model['id']= '1';
		$model['created']= '';
		$model['modified']= '';
		$model['string']= 'I am a string';
		$model['int']= 123;
		$model['undefined']= 'undefined';
		$params= uUtilities::pairs($model);
		$params['table']= uUtilities::table('users');
		//$query= "INSERT INTO app_users (`id`, `created`, `modified`, `string`, `int`, `undefined`) VALUES (1, NULL, NOW(), 'I am a string', '123', '');";
		$this->assertEquals($query, uQueries::create($params));*/
	}
	
	public function testupdate(){ 
		$model= array();
		$model['id']= '1';
		$model['created']= '';
		$model['modified']= '';
		$model['user_id']= 5;
		$model['post_id']= 76;
		$model['content']= 'Test comment';
		extract($params);
		$query= "UPDATE app_comments SET `user_id` = $user_id, `post_id` = $post_id, `content` = $content WHERE id = "$id";";
		$r= uQueries::update($model['id'], 'comments', $model);
		$this->assertEquals($query, $r);
	}
	
	public function testupdate_post(){
  	
	}
	
	public function testdelete(){ 
		$params= array();
		$params['id']= '1';
		extract($params);
		$query= "UPDATE app_stream SET privacy = '-1', modified = NOW() WHERE id = '$id';";
		$this->assertEquals($query, uQueries::delete($params));
	}
	
	/** META **/
	# VIEWS
	public function testviews(){
		// all views by user
		$params= array();
    $params['viewer_id']= 1;
    extract($params);
	  $query= "SELECT * FROM app_views WHERE viewer_id = $viewer_id;";
		$this->assertEquals($query, uQueries::thumbs($params));
	  
	  // all views of user
	  $params= array();
    $params['user_id']= 1;
    extract($params);
	  $query= "SELECT * FROM app_views WHERE user_id = $user_id;";
		$this->assertEquals($query, uQueries::thumbs($params));
		
	  // all views of post
	  $params= array();
    $params['post_id']= 1;
    $params['type']= 'debates';
    extract($params);
	  $query= "SELECT * FROM app_views WHERE post_id = $post_id AND type = '$type';";
		$this->assertEquals($query, uQueries::thumbs($params));
		
		// all views of org
		$params= array();
    $params['org_id']= 1;
    extract($params);
	  $query= "SELECT * FROM app_views WHERE org_id = $org_id;";
		$this->assertEquals($query, uQueries::thumbs($params));
	}
	
  # THUMBS
	public function testthumbs(){
	  // all thumbs by user
		$params= array();
    $params['user_id']= 1;
    extract($params);
	  $query= "SELECT * FROM app_thumbs WHERE user_id = $user_id;";
		$this->assertEquals($query, uQueries::thumbs($params));
	  
	  // all thumbs for post
	  $params= array();
    $params['post_id']= 1;
    $params['type']= 'debates';
    extract($params);
	  $query= "SELECT * FROM app_thumbs WHERE post_id = $post_id AND type = '$type';";
		$this->assertEquals($query, uQueries::thumbs($params));
	}
	
  # COMMENTS
	public function testcomments(){
		// post
		$params= array();
    $params['post_id']= 1;
    $params['type']= 'debates';
    extract($params);
	  $query= "SELECT * FROM app_comments WHERE post_id = $post_id AND type = '$type';";
		$this->assertEquals($query, uQueries::comments($params));
	}
	
	# FOLLOWS
	public function testfollows(){
	  // follows
		$params= array();
    $params['follows']= 1;
    extract($params);
	  $query= "SELECT * FROM app_follows WHERE target_id = $follows;";
		$this->assertEquals($query, uQueries::follows($params));
		
		// following
		$params= array();
    $params['following']= 1;
    extract($params);
	  $query= "SELECT * FROM app_follows WHERE user_id = $following;";
		$this->assertEquals($query, uQueries::follows($params));

		// friends
		/*$params= array();
    $params['friends']= 1;
    extract($params);
	  $query= "SELECT * FROM app_follows WHERE user_id = $friends AND target_id = $follows;";
		$this->assertEquals($query, uQueries::clout($params));*/
	}
	
	# CLOUT
	public function testclout(){
	  // org
		$params= array();
    $params['org_id']= 1;
    extract($params);
	  $query= "SELECT * FROM app_clout WHERE org_id = $org_id;";
		$this->assertEquals($query, uQueries::clout($params));
	}
	
	# REVIEWS
	public function testreviews(){
	  // all reviews for org
	  $org_id= 1; 
	  $query= "SELECT * FROM app_reviews WHERE org_id = $id;";
		$this->assertEquals($query, uQueries::reviews($params));
		
		// all reviews by user
		$params= array();
    $params['user_id']= 1;
    extract($params);
	  $query= "SELECT * FROM app_reviews WHERE user_id = $user_id;";
		$this->assertEquals($query, uQueries::reviews($params));
		
		// paging
		$params= array();
		$params['limit']= 20;
		$params['page']= 2;
		$params['org_id']= 1;
		return "SELECT * FROM app_reviews WHERE org_id = $org_id LIMIT 20,20;";
	}
	
	public function testaddress(){
    //org address
    $params= array();
    $params['org_id']= 1;
    extract($params);
	  $query= "SELECT * FROM app_address WHERE org_id = $org_id;";
		//$this->assertEquals($query, uQueries::address($params));
		
		//user address
		$params= array();
    $params['user_id']= 1;
		extract($params);
	  $query= "SELECT * FROM app_address WHERE user_id = $user_id;";
		//$this->assertEquals($query, uQueries::address($params));
		
		//address id
		$params= array();
		$params['id']= 1;
		extract($params);
	  $query= "SELECT * FROM app_address WHERE id = $id;";
		//$this->assertEquals($query, uQueries::address($params));
	}
	
	/** SESSION **/
  public function testlogin(){ 
		$params= array();
		$params['key']= 'email';
		$params['username']= 'testaccount@phourus.com';
		$params['password']= 'phourus';
		extract($params);
		$query= "SELECT id FROM app_users WHERE `$key` = '$username' AND `password` = '$password';";
		$this->assertEquals($query, uQueries::login($params));
	}
	
	public function testsession(){ 
		$params= array();
		$params['token']= '98NASDF8RQ0ASF';
		$params['user']= 'testaccount@phourus.com';
		extract($params);
		$query= "SELECT * FROM app_sessions WHERE token = '$token' AND user = '$user';";
		$this->assertEquals($query, uQueries::session($params));
	}
	
	public function testsession_auth(){
  	
	}
	
	public function testsession_create(){ 
		$params= array();
		$params['token']= '98NASDF8RQ0ASF';
		$params['user']= 'testaccount@phourus.com';
		extract($params);
		$query= "SELECT * FROM app_sessions WHERE token = '$token' AND user = '$user';";
		$this->assertEquals($query, uQueries::session_create($params));
	}
	
	/** GENERIC **/
	public function testtotal(){ 
		$params= array();
		$params['id']= '1';
		$params['table']= 'app_users';
		$params['trash']= '';
		$params['hard']= '';
		extract($params);
		$query= "SELECT COUNT(*) FROM $table $trash $hard;";
		//$this->assertEquals($query, uQueries::total($params));
	}
	
	public function testunique(){ 
		$params= array();
		$params['field']= 'id';
		$params['table']= 'core_blogs';
		extract($params);
		$query= "SELECT DISTINCT($field) FROM $table;";
		$this->assertEquals($query, uQueries::unique($params));
	}
	
	/** STATS **/
	public function teststats_posts(){
    return "SELECT type, COUNT(type) AS total FROM app_stream WHERE user_id = $user GROUP BY `type`;";
	}
	
	public function teststats_followers(){
	 return "SELECT AVG(app_users.influence) AS average, COUNT(app_users.influence) AS total FROM app_users, app_follows WHERE app_follows.user_id = app_users.id AND app_follows.target_id = $user;";
	}
	
	/** TOTALS **/
	public function testtotal_comments(){
	 $where= "app_stream.user_id = $id";
	 if($type!= null){
  	 $where= "app_stream.post_id = $id AND app_stream.type = '$type'";
	 }
	 return "SELECT COUNT(*) AS total FROM app_stream, app_comments WHERE $where AND app_comments.type = app_stream.type AND app_comments.post_id = app_stream.post_id;";
	 // AND app_comments.user_id != $user;";
	}
	
	public function testtotal_thumbs(){
	 $where= "app_stream.user_id = $id";
	 if($type!= null){
  	 $where= "app_stream.post_id = $id AND app_stream.type = '$type'";
	 }
	 return "SELECT COUNT(*) AS total, SUM(positive) AS positive FROM app_stream, app_thumbs WHERE $where AND app_thumbs.post_id = app_stream.post_id AND app_thumbs.type = app_stream.type AND app_thumbs.user_id != app_stream.user_id;";
	}
	
	public function testtotal_views(){
	 $where= "app_stream.user_id = $id";
	 if($type!= null){
  	 $where= "app_stream.post_id = $id AND app_stream.type = '$type'";
	 }
	 return "SELECT COUNT(*) AS total FROM app_stream, app_views WHERE $where AND app_views.post_id = app_stream.post_id AND app_views.type = app_stream.type AND app_views.user_id != app_stream.user_id;";
	} 
	
	public function testtotal_posts(){
	 return "SELECT COUNT(*) AS total FROM app_stream WHERE app_stream.user_id = $user;";
	} 
	
	public function testowner(){
  	
	}
}

?>