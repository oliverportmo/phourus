<?php

class getTest extends PHPUnit_Framework_TestCase
{

  
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
  	
  	if($options != null){ extract($options); }  	
  	if(isset($token) && isset($user_id)){ $headers= array("x-api-key: $token", "from: $user_id"); }
  	
  	curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
		curl_setopt ($ch, CURLOPT_RETURNTRANSFER, true);
		$result = curl_exec($ch);
		return json_decode($result, true);
	}
	
	public function setUp(){ }
	public function tearDown(){ }
 
 /* #single
 * /single/:type/:id
 * /single/stats/:type/:id
 * /single/comments/:query
 *//* GET
 * 

 *
 * /user/:id
 * /user/stats/:id
 * /user/recent/:id
 *
 * /org/:id
 * /org/stats/:id
 * /org/clout/:id
 * /org/community/:query
 * /org/reviews/:query
 * 
 * #collections
 * /stream/:query
 * /users/:query
 * /orgs/:query 
 * 
 * ??
 * /addresses/:query
 *
 * #auth
 * /session
*
	public function testsession(){
		$path= $this->base.'session';
	}*/
	#######
  # === #
  # GET #
  # === #  
  #######
	public function testpost(){
		// Valid
		$id= '1';
		$r= $this->result("post/$id");
		$this->assertEquals(1, $r['meta']['post_id']);
		$this->assertEquals($id, $r['meta']['post_id']);
		$this->assertEquals(1, $r['meta']['user_id']);
		$this->assertEquals(0, $r['meta']['privacy']);
		//$this->assertEquals($type, $r['meta']['type']);
		
		$this->assertEquals(1, $r['post']['id']);
		$this->assertEquals('Increase school budget: $1.2 Million', $r['post']['title']);
		$this->assertEquals('fiscal', $r['post']['category']);
		$this->assertEquals('local', $r['post']['scope']);
		
		//$this->assertEquals(1, $r['stats']['comments']);
		//$this->assertEquals(2, $r['stats']['thumbs']);
		//$this->assertEquals(1, $r['stats']['positive']);
		//$this->assertEquals(5, $r['stats']['views']);
		
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
		$r= $this->result("single/$type/$id");
		//$this->assertEquals(count($r), 0);
	}
	
	public function testuser(){
		// Valid
		$id= '1';
		$r= $this->result("user/$id");
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
		$r= $this->result("user/$id");
		$this->assertEquals(count($r), 0);
	}
	
	public function testorg(){
  	// Valid
		$org_id= '1';
		$r= $this->result("org/$org_id");
		$r= $r['org'];
		$this->assertEquals($org_id, $r['id']);
		$this->assertEquals(null, $r['sponsor_id']);
		$this->assertEquals('gov', $r['type']);
		$this->assertEquals('City of Newport Beach, CA', $r['name']);
		$this->assertEquals(41, $r['influence']);
		$this->assertEquals('(603)783-1358', $r['phone']);
		$this->assertEquals('(650)646-2855', $r['fax']);
		$this->assertEquals('info@jessedrelick.com', $r['email']);
		
		// Invalid
		$org_id= 'I-DONT-EXIST';
		$r= $this->result("org/$org_id");
		//$this->assertEquals(count($r), 0);
	}
	
	### COLLECTIONS
	public function testposts(){
	  $params= array();
	  $params['page']= 0;
	  $params['limit']= 5;
	  $params['types']= 'blogs;debates;ideas;subjects;';
	  //$params['field']= '';
	  //$params['asc']= '';
	  //$params['mode']= ''; 
	  $query= $this->queryize($params);
	  $this->assertEquals('?page=0&limit=5&types=blogs;debates;ideas;subjects;', $query);
		$r= $this->result("posts/$query");
		$this->assertEquals(count($r), 5);
		
		
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
		$type= 'debates';
		$r= $this->result("stats/?post_id=$post_id&type=$type");
		$this->assertEquals(count($r), 4);
		//$this->assertEquals($r['comments'], 2);
		$this->assertEquals($r['thumbs'], 2);
		$this->assertEquals($r['positive'], 1);
		$this->assertEquals($r['views'], 2);
		
		// User
		$user_id= 1;
		$r= $this->result("stats/?user_id=$user_id");
		$this->assertEquals(count($r), 3);
		
		$totals= $r['totals'];
		$this->assertEquals($totals['comments'], 2);
		$this->assertEquals($totals['thumbs'], 2);
		$this->assertEquals($totals['positive'], 1);
		$this->assertEquals($totals['views'], 2);
		$this->assertEquals($totals['posts'], 6);
		
		$posts= $r['posts'];
		$this->assertEquals($posts['beliefs'], 1);
		$this->assertEquals($posts['debates'], 2);
		$this->assertEquals($posts['quotes'], 3);
		
		$followers= $r['followers'];
		$this->assertEquals($followers['average'], 49.6667);
		$this->assertEquals($followers['total'], 3);
		
		// Org
		$org_id= 1;
		$r= $this->result("stats/?org_id=$org_id");
		//$this->assertEquals($r['views'], 2);
		//$this->assertEquals($r['thumbs'], 2);
		//$this->assertEquals($r['comments'], 2);
		//$this->assertEquals(count($r), 3);
	}	
	
	public function testcomments(){
  	// Post Comments
		$id= '1';
		$type= 'debates';
		$r= $this->result("comments/?post_id=$id&type=$type");
		$this->assertEquals(count($r), 2);
		$this->assertEquals($r[0]['id'], 1);
		$this->assertEquals($r[0]['user_id'], 2);
		$this->assertEquals($r[0]['post_id'], $id);
		$this->assertEquals($r[0]['type'], $type);
		$this->assertEquals($r[0]['comment'], 'Phasellus cursus auctor ante, at tincidunt purus commodo ut.');
		
		$this->assertEquals($r[1]['id'], 2);
		$this->assertEquals($r[1]['user_id'], 3);
		$this->assertEquals($r[1]['post_id'], $id);
		$this->assertEquals($r[1]['type'], $type);
		$this->assertEquals($r[1]['comment'], 'Cras venenatis malesuada erat.');
		

	}
		
  public function testviews(){
    // Post Comments
		$id= '1';
		$type= 'debates';
		$r= $this->result("views/?post_id=$id&type=$type");
		//$this->assertEquals(count($r), 3);
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
		$this->assertEquals('2013-09-18 10:21:19', $r[1]['created']);
  }
  
  public function testaddress(){
    
  }
  
  public function testsession(){
    // Valid
		$options= array();
		$options['token']= '75NnClsSIz4UdD4Lmwxb';
		$options['user_id']= 1;
		$r= $this->result("session/", $options);
		$this->assertEquals($options['token'], $r['token']);
		$this->assertEquals($options['user_id'], $r['user_id']);
		$this->assertTrue(isset($r['expires']));
		$this->assertTrue($r['expires'] != "0000-00-00 00:00:00");
		$this->assertEquals($r['expires'], "2013-10-03 06:36:45");
		
		// Invalid User
		$options= array();
		$options['token']= '75NnClsSIz4UdD4Lmwxb';
		$options['user_id']= 2;
		$r= $this->result("session/", $options);
		$this->assertTrue(is_array($r));
		$this->assertEquals(count($r), 0);
  }  	
}

?>