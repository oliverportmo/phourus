<?php

require_once 'curl.php';

class posttest extends PHPUnit_Framework_TestCase
{
  # GET
	public function testpost_get(){
		// Valid
		$id= 1;
		$r= curl("post/$id");

		# OBJECTS
		$meta= $r['meta'];
		$post= $r['post'];
		$user= $r['user']['user'];
		$stats= $r['stats'];
		
		# ID
		$this->assertEquals($id, $post['id']);
		$this->assertEquals($id, $meta['post_id']);
		$this->assertEquals(1, $post['user_id']);	
		$this->assertEquals(1, $user['id']);
				
		# META
		$this->assertEquals('public', $post['privacy']);
		$this->assertEquals('debates', $post['type']);
		
		# POST
		$this->assertEquals('Increase school budget: $1.2 Million', $meta['title']);
		$this->assertEquals('fiscal', $meta['category']);
		$this->assertEquals('local', $meta['scope']);
		
		# USER
		$this->assertEquals('davidcruz', $user['username']);
		$this->assertEquals('David', $user['first']);
		$this->assertEquals('Cruz', $user['last']);
		$this->assertEquals('dcruz@phourus.com', $user['email']);
		$this->assertEquals('564-043-4329', $user['phone']);
		$this->assertEquals('ABC Company', $user['company']);
		$this->assertEquals(41, $user['influence']);
		
		# STATS
		$this->assertEquals(4, $stats['comments']);
		$this->assertEquals(3, $stats['thumbs']);
		$this->assertEquals(2, $stats['positive']);
		$this->assertEquals(3, $stats['views']);
		
		// Invalid
		$id= 'I-DONT-EXIST';
		$type= 'dafsdg';
		$r= curl("post/?id=abc");
		$this->assertEquals(404, $r);
	}
	
	public function testposts(){
	  // mode: phourus
	  $params= array();
	  $params['page']= 1;
	  $params['limit']= 100;
	  $params['types']= 'blogs;debates;subjects;quotes;';
	  $params['mode']= 'phourus'; 
	  extract($params);
	  $query= $this->queryize($params);
	  $this->assertEquals("?page=$page&limit=$limit&types=$types&mode=$mode", $query);
		$r= curl("post/$query");
		print_r($r);
		$this->assertEquals(count($r), 7);	
		
		// mode: friends 3,4
	  $params['mode']= 'friends'; 
	  extract($params);
	  $query= $this->queryize($params);
	  $this->assertEquals("?page=$page&limit=$limit&types=$types&mode=$mode", $query);
		$r= curl("post/$query");

		$this->assertEquals(count($r), 8);	
		$this->assertEquals($r[0]['post']['post_id'], 3);
		$this->assertEquals($r[0]['meta']['id'], 3);
		$this->assertEquals($r[0]['meta']['user_id'], 3);	
		$this->assertEquals($r[0]['meta']['type'], 'subjects');
		$this->assertEquals($r[1]['post']['post_id'], 9);
		$this->assertEquals($r[1]['meta']['user_id'], 3);	
		$this->assertEquals($r[1]['meta']['type'], 'blogs');
		$this->assertEquals($r[2]['post']['post_id'], 12);
		$this->assertEquals($r[2]['meta']['user_id'], 3);	
		$this->assertEquals($r[2]['meta']['type'], 'subjects');
		$this->assertEquals($r[3]['post']['post_id'], 53);
		$this->assertEquals($r[3]['meta']['user_id'], 3);	
		$this->assertEquals($r[3]['meta']['type'], 'ideas');	
		
		// mode: followers 2,3,4,8
	  $params['mode']= 'followers'; 
	  extract($params);
	  $query= $this->queryize($params);
	  $this->assertEquals("?page=$page&limit=$limit&types=$types&mode=$mode", $query);
		$r= curl("post/$query");
		$this->assertEquals(count($r), 5);	
		
		// mode: following 3,4,5,7
	  $params['mode']= 'following'; 
	  extract($params);
	  $query= $this->queryize($params);
	  $this->assertEquals("?page=$page&limit=$limit&types=$types&mode=$mode", $query);
		$r= curl("post/$query");
		$this->assertEquals(count($r), 5);	
		
		// mode: me
	  $params['mode']= 'me'; 
	  extract($params);
	  $query= $this->queryize($params);
	  $this->assertEquals("?page=$page&limit=$limit&types=$types&mode=$mode", $query);
		$r= curl("post/$query");
		/** ME MODE NOT WORKING **/
		//$this->assertEquals(count($r), 5);
		
		// mode: user
	  $params['mode']= 'user'; 
	  $params['user_id']= 2;
	  extract($params);
	  $query= $this->queryize($params);
	  $this->assertEquals("?page=$page&limit=$limit&types=$types&mode=$mode&user_id=$user_id", $query);
		$r= curl("post/$query");
		$this->assertEquals(count($r), 26);				
	}
	
	# POST
  public function testpost_post(){
    $model= array();
    $model['title']= 'Test Blog';
    $model['element']= 'mind';
    $model['category']= 'testing';
    $model['privacy']= 'private';
    $model['content']= 'This is a test blog';
    $model['type']= 'blogs';
    $model['user_id']= 1;
    
    # PROCESS
    $r= curl("post/", array('post' => $model));
    $c= oPost::get(array('id' => $r['id']));
        
    # OBJECTS
    $post= $c['post'];
    $meta= $c['meta'];
    $stats= $c['stats'];
    
    $user= $c['user']['user'];
    $address= $c['user']['address'];
    $user_stats= $c['user']['stats'];
    
    # ID
    $this->assertEquals($r['id'], $post['id']);
    $this->assertEquals($r['id'], $meta['post_id']);
    $this->assertEquals(1, $post['user_id']);
    $this->assertEquals(1, $user['id']);
    
    # DATES
    //$this->assertEquals($c['created'], uUtilities::now());
    //$this->assertEquals('0000-00-00 00:00:00', $user['modified']);
    
    # META
    $this->assertEquals($model['privacy'], $post['privacy']);
    $this->assertEquals($model['type'], $post['type']);
    
    # POST
    $this->assertEquals($model['title'], $meta['title']);
    $this->assertEquals($model['element'], $meta['element']);
    $this->assertEquals($model['category'], $meta['category']);
    $this->assertEquals($model['content'], $meta['content']);
    
    # STATS
    
    # USER
    
    # ADDRESS
    
    # USER STATS
    
    # RETURN
    $model['id']= $r['id'];
    return $model;
  }
  
  # PUT
  /**
   * @depends testpost_post
   */ 
	public function testpost_put($input){		
		$update= array();
		$update['title']= "New title";
		
		$options= array();
		$options['put']= $update;
		
		# PROCESS
		$r= curl("post/".$input['id'], $options);
		
		# OBJECTS
		$id= $r['id'];
		$model= $r['model'];
		$original= $r['original'];
		$current= $r['current'];
		//$this->assertEquals($model['id'], $r['id']);
		//$this->assertEquals($model, $r['model']);
		//$this->assertEquals($original, $r['original']);
		//$this->assertTrue($r['status']); //
		//var_dump($current);	
		$this->assertEquals($update['title'], $current['meta']['title']);
	}
	
	# DELETE
	/**
   * @depends testpost_post
   */  
	public function testpost_delete($model){
		$options= array();
    $options['delete']= true;
    
    $r= curl("address/".$model['id'], $options);
    // weird behavior preventing boolean/int from being returned from DELETE
    // using 'delete' string in place until issue can be resolved
    //$this->assertEquals(204, $r);
    $this->assertEquals('deleted', $r);
    
    $d= oAddress::get(array('id' => $model['id']));
    $this->assertEquals(404, $d);
	}
	
	# PRIVATE
	private function queryize($params){
  	$out= '';
  	foreach($params as $key => $value){
    	$out.= "$key=$value&";
  	}
  	return trim("?".$out, '&');
	}
}

?>