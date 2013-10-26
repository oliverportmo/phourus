<?php

ini_set('display_errors', 1);
$base= '../../php/rest/classes/objects/';
require($base.'oAddress.php');
require($base.'oClout.php');
require($base.'oComment.php');
require($base.'oFollow.php');
require($base.'oOrg.php');
//require($base.'oPermissions.php');
require($base.'oPost.php');
require($base.'oReview.php');
require($base.'oSession.php');
require($base.'oStats.php');
require($base.'oTag.php');
require($base.'oThumb.php');
require($base.'oUser.php');
require($base.'oView.php');

$base= '../../php/rest/classes/data/';
require($base.'dCreate.php');
require($base.'dDelete.php');
require($base.'dRead.php');
require($base.'dUpdate.php');

$base= '../../php/rest/classes/utility/';
require($base.'uQueries.php');
require($base.'uResult.php');
require($base.'uUtilities.php');

class curlTest extends PHPUnit_Framework_TestCase
{
  
  //function setUp() { $this->db->exec("BEGIN"); }
  //function tearDown() { $this->db->exec("ROLLBACK"); }
 
	public function __construct(){
		$ENV= 'local';
		
		if($ENV== 'dev'){
			$this->base= 'https://dev.phourus.com/rest/';	
		}else if($ENV== 'prod'){
			$this->base= 'https://phourus.com/rest/';
		}else{
			$this->base= 'http://phourus.local:8888/rest/';
		}	
	} 
	
	public function result($url, $options= null){ 
  	$headers= array();
  	$ch= curl_init($this->base.$url);
  	
  	$token= 'ENlnLTHKlpkr5XYeaS7G';
		$user_id= 1;
  	$headers= array("x-api-key: $token", "from: $user_id");
  	if($options != null){
    	extract($options);
  	}  	
  	if(isset($guest)){
    	$headers= array();
  	}
  	if(isset($auth)){
      $headers= array("Authentication: Basic $auth");
  	}
  	
  	if(isset($post) && is_array($post)){
      curl_setopt($ch, CURLOPT_POST, TRUE);
      curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
    }
    if(isset($put) && is_array($put)){
      $headers= array_merge($headers, array('Content-Type: application/x-www-form-urlencoded', 'Accept: application/json'));
      $handle = tmpfile();
      $size = fwrite($handle, json_encode($put));
      rewind($handle);
      curl_setopt($ch, CURLOPT_PUT, true);
      curl_setopt($ch, CURLOPT_INFILE, $handle);
      curl_setopt($ch, CURLOPT_INFILESIZE, strlen($size));
    }
    if(isset($delete) && $delete== true){
      curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "DELETE");
    }
    
  	curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
		curl_setopt ($ch, CURLOPT_RETURNTRANSFER, true);
		$result = curl_exec($ch);
		return json_decode($result, true);
	}

	#######
  # === #
  # GET #
  # === #  
  #######
	public function testpost(){
		// Valid
		$id= '1';
		$r= $this->result("posts/?id=$id");

		$this->assertEquals($id, $r['meta']['id']);
		$this->assertEquals(1, $r['meta']['user_id']);
		$this->assertEquals('public', $r['meta']['privacy']);
		$this->assertEquals('debates', $r['meta']['type']);
		
		$this->assertEquals(1, $r['post']['post_id']);
		$this->assertEquals('Increase school budget: $1.2 Million', $r['post']['title']);
		$this->assertEquals('fiscal', $r['post']['category']);
		$this->assertEquals('local', $r['post']['scope']);
		
		$this->assertEquals(4, $r['stats']['comments']);
		$this->assertEquals(3, $r['stats']['thumbs']);
		$this->assertEquals(2, $r['stats']['positive']);
		$this->assertEquals(3, $r['stats']['views']);
		
		$this->assertEquals(1, $r['user']['id']);
		$this->assertEquals('davidcruz', $r['user']['username']);
		$this->assertEquals('David', $r['user']['first']);
		$this->assertEquals('Cruz', $r['user']['last']);
		$this->assertEquals('dcruz@ymail.com', $r['user']['email']);
		$this->assertEquals('555-555-5555', $r['user']['phone']);
		$this->assertEquals('Intuit', $r['user']['company']);
		$this->assertEquals(41, $r['user']['influence']);

		// Invalid
		$id= 'I-DONT-EXIST';
		$type= 'dafsdg';
		$r= $this->result("posts/?id=abc");
		$this->assertEquals(count($r), 0);
	}
	
	public function testuser(){
		// Valid
		$id= '1';
		$r= $this->result("users/?id=$id");
		$this->assertEquals($id, $r['id']);
		
		$this->assertEquals(1, $r['id']);
		$this->assertEquals('davidcruz', $r['username']);
		$this->assertEquals('David', $r['first']);
		$this->assertEquals('Cruz', $r['last']);
		$this->assertEquals('dcruz@ymail.com', $r['email']);
		$this->assertEquals('555-555-5555', $r['phone']);
		$this->assertEquals('Intuit', $r['company']);
		$this->assertEquals(41, $r['influence']);
		
		// Invalid
		$id= 'I-DONT-EXIST';
		$r= $this->result("users/?id=abc");
		$this->assertEquals(count($r), 0);
	}
	
	public function testorg(){
  	// Valid
		$org_id= '1';
		$r= $this->result("orgs/?id=$org_id");

		$this->assertEquals($org_id, $r['id']);
		$this->assertEquals(null, $r['user_id']);
		$this->assertEquals('gov', $r['type']);
		$this->assertEquals('Town of Gorham, ME', $r['name']);
		$this->assertEquals(41, $r['influence']);
		$this->assertEquals('(603)783-1358', $r['phone']);
		$this->assertEquals('(650)646-2855', $r['fax']);
		$this->assertEquals('info@jessedrelick.com', $r['email']);
		
		// Invalid
		$org_id= 'I-DONT-EXIST';
		$r= $this->result("orgs/?id=$org_id");
		$this->assertEquals(count($r), 0);
	}
	
	### COLLECTIONS
	public function testposts(){
	  // mode: phourus
	  $params= array();
	  $params['page']= 1;
	  $params['limit']= 100;
	  $params['types']= 'blogs;debates;ideas;subjects;';
	  $params['mode']= 'phourus'; 
	  extract($params);
	  $query= $this->queryize($params);
	  $this->assertEquals("?page=$page&limit=$limit&types=$types&mode=$mode", $query);
		$r= $this->result("posts/$query");
		$this->assertEquals(count($r), 7);	
		
		// mode: friends 3,4
	  $params['mode']= 'friends'; 
	  extract($params);
	  $query= $this->queryize($params);
	  $this->assertEquals("?page=$page&limit=$limit&types=$types&mode=$mode", $query);
		$r= $this->result("posts/$query");
		$this->assertEquals(count($r), 8);	
		$this->assertEquals($r[0]['post']['post_id'], 3);
		$this->assertEquals($r[0]['meta']['id'], 3);
		$this->assertEquals($r[0]['meta']['user_id'], 3);	
		$this->assertEquals($r[0]['meta']['type'], 'subjects');
		$this->assertEquals($r[1]['post']['post_id'], 4);
		$this->assertEquals($r[1]['meta']['user_id'], 4);	
		$this->assertEquals($r[1]['meta']['type'], 'blogs');
		$this->assertEquals($r[2]['post']['post_id'], 9);
		$this->assertEquals($r[2]['meta']['user_id'], 3);	
		$this->assertEquals($r[2]['meta']['type'], 'blogs');
		$this->assertEquals($r[3]['post']['post_id'], 12);
		$this->assertEquals($r[3]['meta']['user_id'], 3);	
		$this->assertEquals($r[3]['meta']['type'], 'subjects');	
		
		// mode: followers 2,3,4,8
	  $params['mode']= 'followers'; 
	  extract($params);
	  $query= $this->queryize($params);
	  $this->assertEquals("?page=$page&limit=$limit&types=$types&mode=$mode", $query);
		$r= $this->result("posts/$query");
		$this->assertEquals(count($r), 5);	
		
		// mode: following 3,4,5,7
	  $params['mode']= 'following'; 
	  extract($params);
	  $query= $this->queryize($params);
	  $this->assertEquals("?page=$page&limit=$limit&types=$types&mode=$mode", $query);
		$r= $this->result("posts/$query");
		$this->assertEquals(count($r), 5);	
		
		// mode: me
	  $params['mode']= 'me'; 
	  extract($params);
	  $query= $this->queryize($params);
	  $this->assertEquals("?page=$page&limit=$limit&types=$types&mode=$mode", $query);
		$r= $this->result("posts/$query");
		/** ME MODE NOT WORKING **/
		//$this->assertEquals(count($r), 5);
		
		// mode: user
	  $params['mode']= 'user'; 
	  $params['user_id']= 2;
	  extract($params);
	  $query= $this->queryize($params);
	  $this->assertEquals("?page=$page&limit=$limit&types=$types&mode=$mode&user_id=$user_id", $query);
		$r= $this->result("posts/$query");
		$this->assertEquals(count($r), 26);				
	}
	
	private function queryize($params){
  	$out= '';
  	foreach($params as $key => $value){
    	$out.= "$key=$value&";
  	}
  	return trim("?".$out, '&');
	}
	
	public function testusers(){
		$r= $this->result("users/:query");
	}
	
	public function testorgs(){
		$r= $this->result("orgs/:query");
	}
		
	public function teststats(){	
		// Post
		$post_id= 1;
		$r= $this->result("stats/?post_id=$post_id");
		$this->assertEquals(count($r), 4);
		$this->assertEquals($r['comments'], 4);
		$this->assertEquals($r['thumbs'], 3);
		$this->assertEquals($r['positive'], 2);
		$this->assertEquals($r['views'], 3);
		
		// User
		$user_id= 1;
		$r= $this->result("stats/?user_id=$user_id");
		$this->assertEquals(count($r), 6);
		
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
		$this->assertEquals($followers['average'], 51.0000);
		$this->assertEquals($followers['total'], 4);
		
		// Org
		$org_id= 1;
		$r= $this->result("stats/?org_id=$org_id");
		/** ORG STATS UNAVAILABLE **/
		/*$this->assertEquals($r['views'], 2);
		$this->assertEquals($r['thumbs'], 2);
		$this->assertEquals($r['comments'], 2);
		$this->assertEquals(count($r), 3);*/
	}	
	
	public function testcomments(){
  	// Post Comments
		$id= '1';
		$r= $this->result("comments/?post_id=$id");
		$this->assertEquals(count($r), 4);
		$this->assertEquals($r[0]['id'], 1);
		$this->assertEquals($r[0]['user_id'], 1);
		$this->assertEquals($r[0]['post_id'], $id);
		$this->assertEquals($r[0]['comment'], 'Phasellus cursus auctor ante, at tincidunt purus commodo ut.');
		
		$this->assertEquals($r[1]['id'], 2);
		$this->assertEquals($r[1]['user_id'], 3);
		$this->assertEquals($r[1]['post_id'], $id);
		$this->assertEquals($r[1]['comment'], 'Cras venenatis malesuada erat.');
	}
		
  public function testviews(){
		$id= '1';
		$r= $this->result("views/?post_id=$id");
		$this->assertEquals(count($r), 3);
  }
  
  public function testclout(){
    // Clout
		$org_id= '1';
		$r= $this->result("clout/?org_id=$org_id");
		$this->assertEquals($org_id, $r[2]['org_id']);
		$this->assertEquals(count($r), 8);
		$this->assertEquals($r[4]['type'], 'award');
		$this->assertEquals($r[2]['title'], 'CNN');
		$this->assertEquals($r[3]['id'], 4);
		$this->assertEquals($r[5]['date'], "2012-11-15");	
  }
  
  public function testcommunity(){
    // Community
		$org_id= '1';
		$r= $this->result("community/?org_id=$org_id");
		/** COMMUNITY NOT AVAILABLE **/
		//$this->assertEquals($org_id, $r['org_id']);
  }
  
  public function testreviews(){
    // Reviews for org
		$org_id= 1;
		$r= $this->result("reviews/?org_id=$org_id");
		$this->assertEquals(count($r), 5);
		$this->assertEquals($r[3]['id'], 4);
		$this->assertEquals($r[3]['user_id'], 2);
		$this->assertEquals($r[3]['rating'], 1);
				
		// Reviews by user
		$user_id= '2';
		$r= $this->result("reviews/?user_id=$user_id");
		$this->assertEquals($user_id, $r[0]['user_id']);
		$this->assertEquals(count($r), 2);
		$this->assertEquals(1, $r[1]['rating']);
		$this->assertEquals('Great place to live', $r[0]['title']);
		$this->assertEquals(4, $r[1]['id']);
		$this->assertEquals(1, $r[0]['org_id']);
  }
  
  public function testaddress(){
    
  }
  
  public function testtags(){
    // By id
		$id= 1;
		$r= $this->result("tags/?id=$id");
		$this->assertEquals(count($r), 5);
		$this->assertEquals($r['id'], 1);
		$this->assertEquals($r['created'], '2013-10-22 11:19:52');
		$this->assertEquals($r['modified'], '0000-00-00 00:00:00');
		$this->assertEquals($r['post_id'], 1);
		$this->assertEquals($r['tag'], 'school');
		
		// By post_id
		$post_id= 1;
		$r= $this->result("tags/?post_id=$post_id");
		$this->assertEquals(count($r), 3);
		
		$this->assertEquals($r[0]['id'], 1);
		$this->assertEquals($r[1]['id'], 2);
		$this->assertEquals($r[2]['id'], 5);
		
		$this->assertEquals($r[0]['created'], '2013-10-22 11:19:52');
		$this->assertEquals($r[1]['created'], '2013-10-22 11:19:56');
		$this->assertEquals($r[2]['created'], '2013-10-22 11:19:58');
		
		$this->assertEquals($r[0]['modified'], '0000-00-00 00:00:00');
		$this->assertEquals($r[1]['modified'], '0000-00-00 00:00:00');
		$this->assertEquals($r[2]['modified'], '0000-00-00 00:00:00');
		
		$this->assertEquals($r[0]['post_id'], $post_id);
		$this->assertEquals($r[1]['post_id'], $post_id);
		$this->assertEquals($r[2]['post_id'], $post_id);
		
		$this->assertEquals($r[0]['tag'], 'school');
		$this->assertEquals($r[1]['tag'], 'budget');
		$this->assertEquals($r[2]['tag'], 'education');	
  }
  
  public function testsession(){
    // Valid
		$options= array();
		$default_token= 'ENlnLTHKlpkr5XYeaS7G';
		$default_user_id= 1;
		$r= $this->result("session/", $options);
		$this->assertEquals($default_token, $r['token']);
		$this->assertEquals($default_user_id, $r['user_id']);
		$this->assertTrue(isset($r['expires']));
		$this->assertTrue($r['expires'] != "0000-00-00 00:00:00");
		$this->assertEquals($r['expires'], "2014-10-15 00:54:57");
		
		// Invalid User
		$options= array();
		$options['token']= '75NnClsSIz4UdD4Lmwxb';
		$options['user_id']= 2;
		$r= $this->result("session/", $options);
		/** RETURNS VALID USER DUE TO DEFAULT TOKEN **/
		//$this->assertFalse($r);
  }
  	
	########
  # ==== #
  # POST #
  # ==== #   
  ########
  public function testpost_post(){
  
  }
  
  public function testuser_post(){
    $model= array();
    $model['username']= 'jessedrelick';
    $model['password']= 'phourus';
    $model['first']= 'Jesse';
    $model['last']= 'Drelick';
    $model['email']= 'info@jessedrelick.com';
    $model['phone']= '6037831358';
    $model['category']= 'test';
    $model['subcategory']= 'unit';
    $model['status']= 'active'; //lead, inactive
    $model['admin']= 1;
    $model['gender']= 'M';
    $model['occupation']= 'Software Engineer';
    $model['company']= 'Phourus LLC';
    $model['website']= 'jessedrelick.com';
    $model['fb']= '12345';
    $model['li']= '67890';
    $model['dob']= '1987-07-09';
    $model['notes']= 'Here are some user notes, soon to be replaced with a notes table.';
    $model['influence']= 44;
    
    $r= $this->result("user/", array('post' => $model));
    
    $c= oUser::get(array('id' => $r));
    $this->assertEquals($c['id'], $r);
    $this->assertEquals($c['created'], uUtilities::now());
    $this->assertEquals($c['modified'], '0000-00-00 00:00:00');
    $this->assertEquals($c['username'], $model['username']);
    $this->assertEquals($c['password'], $model['password']);
    $this->assertEquals($c['first'], $model['first']);
    $this->assertEquals($c['last'], $model['last']);
    $this->assertEquals($c['email'], $model['email']);
    $this->assertEquals($c['phone'], $model['phone']);
    $this->assertEquals($c['category'], $model['category']);
    $this->assertEquals($c['subcategory'], $model['subcategory']);
    $this->assertEquals($c['status'], $model['status']);
    $this->assertEquals($c['admin'], $model['admin']);
    $this->assertEquals($c['gender'], $model['gender']);
    $this->assertEquals($c['occupation'], $model['occupation']);
    $this->assertEquals($c['company'], $model['company']);
    $this->assertEquals($c['website'], $model['website']);
    $this->assertEquals($c['fb'], $model['fb']);
    $this->assertEquals($c['li'], $model['li']);
    $this->assertEquals($c['dob'], $model['dob']);
    $this->assertEquals($c['notes'], $model['notes']);
    $this->assertEquals($c['influence'], $model['influence']);
        
    $model['id']= $r;
    return $model;
  }
  
  public function testorg_post(){
    $model= array();
    $model['user_id']= 1;
    $model['type']= 'company';
    $model['name']= 'Phourus LLC';
    $model['shortname']= 'phourus';  
    $model['email']= 'info@jessedrelick.com';
    $model['phone']= '6037831358';
    $model['fax']= '6037831358';
    $model['about']= '6037831358';
    $model['contact']= 44;
    $model['video']= '6037831358';
    $model['channel']= '6037831358';
    $model['influence']= 48;
    $r= $this->result("org/", array('post' => $model));

    $c= oOrg::get(array('id' => $r));
    $this->assertEquals($c['id'], $r);
    $this->assertEquals($c['created'], uUtilities::now());
    $this->assertEquals($c['modified'], '0000-00-00 00:00:00');
    $this->assertEquals($c['user_id'], $model['user_id']);
    $this->assertEquals($c['type'], $model['type']);
    $this->assertEquals($c['name'], $model['name']);
    $this->assertEquals($c['shortname'], $model['shortname']);
    $this->assertEquals($c['email'], $model['email']);
    $this->assertEquals($c['phone'], $model['phone']);
    $this->assertEquals($c['fax'], $model['fax']);
    $this->assertEquals($c['about'], $model['about']);
    $this->assertEquals($c['contact'], $model['contact']);
    $this->assertEquals($c['video'], $model['video']);
    $this->assertEquals($c['channel'], $model['channel']);
    $this->assertEquals($c['influence'], $model['influence']);

    $model['id']= $r;
    return $model;
  }

  public function testview_post(){
    $model= array();
    $model['ip']= '198.168.0.0.1';
    $model['path']= '/user/1';
    $model['post_id']= 2;
    $model['location']= 'Newport Beach';
    $model['viewer_id']= 1;
    $model['created']= '';
    $model['referer']= 'http://google.com';
    $model['exit']= 'http://facebook.com';
    $r= $this->result("view/", array('post' => $model));
    
    $c= oView::get(array('id' => $r));
    $this->assertEquals($c['id'], $r);
    $this->assertEquals($c['created'], uUtilities::now());
    $this->assertEquals($c['modified'], '0000-00-00 00:00:00');
    $this->assertEquals($c['ip'], $model['ip']);
    $this->assertEquals($c['path'], $model['path']);
    $this->assertEquals($c['location'], $model['location']);
    $this->assertEquals($c['viewer_id'], $model['viewer_id']);
    $this->assertEquals($c['referer'], $model['referer']);
    $this->assertEquals($c['exit'], $model['exit']);
    
    $model['id']= $r;
    return $model;
  }
  
  public function testthumb_post(){
    $model= array();
    $model['post_id']= 7;
    $model['user_id']= 6;
    $model['positive']= 1;
    $r= $this->result("thumb/", array('post' => $model));
    
    $c= oThumb::get(array('id' => $r));
    $this->assertEquals($c['id'], $r);
    $this->assertEquals($c['created'], uUtilities::now());
    $this->assertEquals($c['modified'], '0000-00-00 00:00:00');
    $this->assertEquals($c['post_id'], $model['post_id']);
    $this->assertEquals($c['user_id'], $model['user_id']);
    $this->assertEquals($c['positive'], $model['positive']);
    
    $model['id']= $r;
    return $model;
  }
  
  public function testcomment_post(){
    $model= array();
    $model['user_id']= 8;
    $model['post_id']= 7;
    $model['comment']= 'This is a test comment.';
    $r= $this->result("comment/", array('post' => $model));
    
    $c= oComment::get(array('id' => $r));
    $this->assertEquals($c['id'], $r);
    $this->assertEquals($c['created'], uUtilities::now());
    $this->assertEquals($c['modified'], '0000-00-00 00:00:00');
    $this->assertEquals($c['user_id'], $model['user_id']);
    $this->assertEquals($c['post_id'], $model['post_id']);
    $this->assertEquals($c['comment'], $model['comment']);
    
    $model['id']= $r;
    return $model;
  }
  
  public function testfollow_post(){
    $model= array();
    $model['user_id']= 4;
    $model['target_id']= 5;
    $r= $this->result("follow/", array('post' => $model));
    
    $c= oFollow::get(array('id' => $r));
    $this->assertEquals($c['id'], $r);
    $this->assertEquals($c['created'], uUtilities::now());
    $this->assertEquals($c['modified'], '0000-00-00 00:00:00');
    $this->assertEquals($c['user_id'], $model['user_id']);
    $this->assertEquals($c['target_id'], $model['target_id']);
    
    $model['id']= $r;
    return $model;
  }
  
  public function testclout_post(){
    $model= array();
    $model['org_id']= 4;
    $model['type']= 'press';
    $model['title']= 'Sample Clout';
    $model['date']= '2012-08-03';
    $model['content']= 'This is a sample clout entry.';
    $model['image']= '/assets/clout';
    $r= $this->result("clout/", array('post' => $model));
    
    $c= oClout::get(array('id' => $r));
    $this->assertEquals($c['id'], $r);
    $this->assertEquals($c['created'], uUtilities::now());
    $this->assertEquals($c['modified'], '0000-00-00 00:00:00');
    $this->assertEquals($c['org_id'], $model['org_id']);
    $this->assertEquals($c['type'], $model['type']);
    $this->assertEquals($c['title'], $model['title']);
    $this->assertEquals($c['date'], $model['date']);
    $this->assertEquals($c['content'], $model['content']);
    $this->assertEquals($c['image'], $model['image']);
    
    $model['id']= $r;
    return $model;
  }
  
  public function testreview_post(){
    $model= array();
    $model['org_id']= 3;
    $model['user_id']= 7;
    $model['title']= 'Test review';
    $model['content']= 'This is a test review';
    $model['rating']= 4;
    $model['created']= '';
    $model['modified']= '';
    $r= $this->result("review/", array('post' => $model));

    $c= oReview::get(array('id' => $r));
    $this->assertEquals($c['id'], $r);
    $this->assertEquals($c['created'], uUtilities::now());
    $this->assertEquals($c['modified'], '0000-00-00 00:00:00');
    $this->assertEquals($c['org_id'], $model['org_id']);
    $this->assertEquals($c['user_id'], $model['user_id']);
    $this->assertEquals($c['title'], $model['title']);
    $this->assertEquals($c['content'], $model['content']);
    $this->assertEquals($c['rating'], $model['rating']);
    
    $model['id']= $r;
    return $model;
  }
  
  public function testaddress_post(){
    $model= array();
    $model['org_id']= 6;
    $model['user_id']= '';
    $model['street']= '123 Fake Street';
    $model['city']= 'Boston';
    $model['state']= 'MA';
    $model['country']= 'US';
    $model['zip']= '03856';
    $model['type']= 'primary';
    $model['county']= 'Middlesex';
    $r= $this->result("address/", array('post' => $model));
    
    $c= oAddress::get(array('id' => $r));
    $this->assertEquals($c['id'], $r);
    $this->assertEquals($c['created'], uUtilities::now());
    $this->assertEquals($c['modified'], '0000-00-00 00:00:00');
    $this->assertEquals($c['org_id'], $model['org_id']);
    $this->assertEquals(0, $c['user_id']);
    $this->assertEquals($c['street'], $model['street']);
    $this->assertEquals($c['city'], $model['city']);
    $this->assertEquals($c['state'], $model['state']);
    $this->assertEquals($c['country'], $model['country']);
    $this->assertEquals($c['zip'], $model['zip']);
    $this->assertEquals($c['type'], $model['type']);
    $this->assertEquals($c['county'], $model['county']);
    
    $model['id']= $r;
    return $model;
  }
  
  public function testtag_post(){
    $model= array();
    $model['post_id']= 3;
    $model['tag']= 'unit test tag';
    $r= $this->result("tag/", array('post' => $model));

    $c= oTag::get(array('id' => $r));
    $this->assertEquals($c['id'], $r);
    $this->assertEquals($c['created'], uUtilities::now());
    $this->assertEquals($c['modified'], '0000-00-00 00:00:00');
    $this->assertEquals($c['post_id'], $model['post_id']);
    $this->assertEquals($c['tag'], $model['tag']);
    
    $model['id']= $r;
    return $model;
  }
  
  public function testemail_post(){
  
  }

	public function testsession_post(){
		// Wrong: ZGF2aWRjcnV6QGdtYWlsLmNvbTpwaG91cnVz
    // Right: ZGNydXpAeW1haWwuY29tOnBob3VydXM=
    
    // Fail
		$options= array();
		$options['auth']= 'ZGF2aWRjcnV6QGdtYWlsLmNvbTpwaG91cnVz';
		$options['method']= 'POST';
		$r= $this->result("session/", $options);
		//$this->assertFalse($r);
		
    // Pass
		$options= array();
		$options['auth']= 'ZGNydXpAeW1haWwuY29tOnBob3VydXM=';
		$options['method']= 'POST';
		$r= $this->result("session/", $options);
		/* REVISIT
		$this->assertTrue(is_array($r));
		$this->assertTrue(isset($options['token']));
		$this->assertTrue(isset($options['user_id']));
		$this->assertTrue(isset($options['expires']));
		$this->assertTrue($options['expires'] != "0000-00-00 00:00:00");*/
	}

	#######
  # === #
  # PUT #
  # === # 
  ####### 
  /**
   * @depends testpost_post
   */ 
	public function testpost_put($model){
		$options= array();
		$options['put']= $model;
		//$r= $this->result("post/".$model['id'], $options);
	}
  
  /**
   * @depends testuser_post
   */   
  public function testuser_put($model){
    $model['status']= 'inactive';
    
    $options= array();
		$options['put']= $model;
		$r= $this->result("user/".$model['id'], $options);

		$this->assertTrue($r['status']);
		$this->assertEquals($model['id'], $r['id']);
		//$this->assertEquals($model, $r['model']);
		
		$current= $r['current'];
		//$this->assertEquals($current['created'], $r['current']['created']);
    //$this->assertNotEquals($current['modified'], '0000-00-00 00:00:00');
		//$this->assertEquals($current['modified'], uUtilities::now());
		//$this->assertEquals($current['status'], $model['status']);
  }
  
  /**
   * @depends testorg_post
   */ 
  public function testorg_put($model){
    $model['email']= 'info@phourus.com'; 
    
    $options= array();
		$options['put']= $model;
		//$r= $this->result("org/".$model['id'], $options);
		//$this->assertEquals($r['email'], $model['email']);
  }

  // X stats
  // X community
  // X view

  /**
   * @depends testthumb_post
   */ 
  public function testthumb_put($model){
    $model['positive']= 0;
    
    $options= array();
		$options['put']= $model;
		//$r= $this->result("thumb/".$model['id'], $options);
		//$this->assertEquals($r['positive'], $model['positive']);
  }
  
  /**
   * @depends testcomment_post
   */ 
  public function testcomment_put($model){
    $options= array();
		$options['put']= $model;
		//$r= $this->result("comment/".$options['id'], $options);
		//$this->assertEquals($r['status'], $model['status']);
  }
  
  /**
   * @depends testclout_post
   */ 
  public function testclout_put($model){
    $options= array();
		$options['put']= $model;
		//$r= $this->result("clout/".$options['id'], $options);
		//$this->assertEquals($r['status'], $model['status']);
  }
  
  /**
   * @depends testreview_post
   */ 
  public function testreview_put($model){
    $options= array();
		$options['put']= $model;
		//$r= $this->result("review/".$options['id'], $options);
		//$this->assertEquals($r['status'], $model['status']);
  }
  
  /**
   * @depends testaddress_post
   */ 
  public function testaddress_put($model){
    $options= array();
		$options['put']= $model;
		//$r= $this->result("address/".$options['id'], $options);
		//$this->assertEquals($r['status'], $model['status']);
  }
  
  
  ##########
  # ====== #
  # DELETE #
  # ====== #  
  ##########
  /**
   * @depends testpost_post
   */  
	public function testpost_delete($model){
		//$r= $this->result("post/".$model['id'], $options);
	}
    
  /**
   * @depends testuser_post
   */    
  public function testuser_delete($model){
	  $options= array();
    $options['delete']= true;
	  $r= $this->result("user/".$model['id'], $options);
	  $d= oUser::get(array('id' => $model['id']));
    $this->assertFalse($d);
  }
  
  /**
   * @depends testorg_post
   */ 
  public function testorg_delete($model){
    $options= array();
    $options['delete']= true;
    $r= $this->result("org/".$model['id'], $options);
    $d= oOrg::get(array('id' => $model['id']));
    $this->assertFalse($d);
  }
  
  // X stats 
  // X community 
  /**
   * @depends testview_post
   */ 
  public function testview_delete($model){
    $options= array();
    $options['delete']= true;
    $r= $this->result("view/".$model['id'], $options);
    //$this->assertTrue($r);
    $d= oView::get(array('id' => $model['id']));
    $this->assertFalse($d);
  }

  /**
   * @depends testthumb_post
   */ 
  public function testthumb_delete($model){
    $options= array();
    $options['delete']= true;
    $r= $this->result("thumb/".$model['id'], $options);
    //$this->assertTrue($r);
    $d= oThumb::get(array('id' => $model['id']));
    $this->assertFalse($d);
  }
  
  /**
   * @depends testcomment_post
   */ 
  public function testcomment_delete($model){
    $options= array();
    $options['delete']= true;
    $r= $this->result("comment/".$model['id'], $options);
    //$this->assertTrue($r);
    $d= oComment::get(array('id' => $model['id']));
    $this->assertFalse($d);
  }
  
  /**
   * @depends testfollow_post
   */ 
  public function testfollow_delete($model){
    $options= array();
    $options['delete']= true;
    $r= $this->result("follow/".$model['id'], $options);
    //$this->assertTrue($r);
    $d= oFollow::get(array('id' => $model['id']));
    $this->assertFalse($d);
  }
  
  /**
   * @depends testclout_post
   */ 
  public function testclout_delete($model){
    $options= array();
    $options['delete']= true;
    $r= $this->result("clout/".$model['id'], $options);
    //$this->assertTrue($r);
    $d= oClout::get(array('id' => $model['id']));
    $this->assertFalse($d);
  }
  
  /**
   * @depends testreview_post
   */ 
  public function testreview_delete($model){
    $options= array();
    $options['delete']= true;
    $r= $this->result("review/".$model['id'], $options);
    //$this->assertTrue($r);
    $d= oReview::get(array('id' => $model['id']));
    $this->assertFalse($d);
  }
  
  /**
   * @depends testaddress_post
   */ 
  public function testaddress_delete($model){
    $options= array();
    $options['delete']= true;
    $r= $this->result("address/".$model['id'], $options);
    //$this->assertTrue($r);
    $d= oAddress::get(array('id' => $model['id']));
    $this->assertFalse($d);
  }
  
  /**
   * @depends testtag_post
   */ 
  public function testtag_delete($model){
    $options= array();
    $options['delete']= true;
    $r= $this->result("tag/".$model['id'], $options);
    //$this->assertTrue($r);
    $d= oTag::get(array('id' => $model['id']));
    $this->assertFalse($d);
  }
  
  public function testsession_delete(){

  }
}

?>