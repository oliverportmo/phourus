<?php

require_once 'curl.php';

class usertest extends PHPUnit_Framework_TestCase
{
  
  # GET	
	public function testuser_get(){
		// Valid
		$id= 1;
		$r= curl("user/?id=$id");
		
		# OBJECTS
		$user= $r['user'];
		$stats= $r['stats'];
		$address= $r['address'];
		
		# ID
		$this->assertEquals($id, $user['id']);
		
		# USER
		$this->assertEquals('davidcruz', $user['username']);
		$this->assertEquals('David', $user['first']);
		$this->assertEquals('Cruz', $user['last']);
		$this->assertEquals('dcruz@phourus.com', $user['email']);
		$this->assertEquals('555-555-5555', $user['phone']);
		$this->assertEquals('ABC Company', $user['company']);
		$this->assertEquals(41, $user['influence']);

		# ADDRESS		
		
		// Invalid
		$r= curl("user/?id=abc");
		// returning 503
		//$this->assertEquals(404, $r);
	}
	
	# POST
  public function testuser_post(){    
    // post minimal
    $username= 'unit@phourus.com';
    $password= 'phourus';
    $auth= base64_encode($username.":".$password);
    
    # PROCESS
    $r= curl("user/", array('post' => array(), 'auth' => $auth));
    
    # token
    $this->assertArrayHasKey('id', $r);
    $this->assertArrayHasKey('created', $r);
    $this->assertArrayHasKey('expires', $r);
    $this->assertArrayHasKey('user_id', $r);
    $this->assertArrayHasKey('user', $r);

    //$current = date();
    //$this->assertRegExp('//', $r['id']);
    //$this->assertEquals($current, $r['created']);
    //$this->assertEquals($expires, $r['expires']);
    //$this->assertEquals($user_id);
    
    # user
    $u= $r['user'];
    $this->assertArrayHasKey('user', $u);
    $this->assertArrayHasKey('stats', $u);
    $this->assertArrayHasKey('address', $u);
    
    $user= $u['user'];
    $this->assertEquals($r['user_id'], $user['id']); 
    //$this->assertEquals($r['created'], $user['created']);
    $this->assertEquals('0000-00-00 00:00:00', $user['modified']);
    $this->assertNull($user['username']);
    $this->assertNull($user['first']); 
    $this->assertNull($user['last']);   
    $this->assertEquals($username, $user['email']);
    $this->assertNull($user['phone']);
    $this->assertNull($user['status']);
    $this->assertNull($user['gender']);
    $this->assertNull($user['occupation']);
    $this->assertNull($user['company']);
    $this->assertNull($user['website']);
    $this->assertNull($user['dob']);
    $this->assertNull($user['influence']);
    $this->assertNull($user['img']);
    
    # stats
    $stats= $u['stats'];
    $this->assertEquals(0, $stats['views']);
    $this->assertEquals(0, $stats['thumbs']);
    $this->assertEquals(0, $stats['positive']);
    $this->assertEquals(0, $stats['comments']);
    $this->assertEquals(0, $stats['popularity']);
    $this->assertEquals(404, $stats['posts']);
    $this->assertArrayHasKey('followers', $stats);
    $this->assertEquals(0, $stats['followers']['average']);
    $this->assertEquals(0, $stats['followers']['total']);
    
    # address
    $this->assertEquals(404, $u['address']);

    # RETURN    
    $model['id']= $r['user_id'];
    return $model;
  }
  
  # PUT
  /**
   * @depends testuser_post
   */   
  public function testuser_put($input){
    // minimal
    $update= array();
    $update['status']= 'inactive';
    		
		# PROCESS
		$r= curl("user/".$input['id'], array('put' => $update));
		
		# OBJECTS
		$this->assertArrayHasKey('id', $r);
		$this->assertArrayHasKey('model', $r);
		$this->assertArrayHasKey('original', $r);
		$this->assertArrayHasKey('current', $r);
		
		$id= $r['id'];
		$model= $r['model'];
		$original= $r['original'];
		$current= $r['current'];
		
		$this->assertEquals($update, $model);
		$this->assertEquals($input['id'], $id);
		
		$current= $r['current'];	
		$this->assertNotEquals('0000-00-00 00:00:00', $current['modified']);
		$this->assertEquals($update['status'], $current['status']);
		
		// full
    $update= array();
    $update['username']= 'TESTER';
    $update['first']= 'Jesse';
    $update['last']= 'Drelick';
    $update['phone']= '6037831358';
    $update['status']= 'active';
    $update['gender']= 'M';
    $update['occupation']= 'Software Engineer';
    $update['company']= 'Phourus LLC';
    $update['website']= 'jessedrelick.com';
    $update['dob']= '1987-07-09';
    $update['influence']= 44;
    
    # PROCESS
    $r= curl("user/".$input['id'], array('put' => $update));
    
    # OBJECTS
		$this->assertArrayHasKey('id', $r);
		$this->assertArrayHasKey('model', $r);
		$this->assertArrayHasKey('original', $r);
		$this->assertArrayHasKey('current', $r);
		
		$id= $r['id'];
		$model= $r['model'];
		$original= $r['original'];
		$current= $r['current'];
		
		$this->assertEquals($update, $model);
		$this->assertEquals($input['id'], $id);
		
		$current= $r['current'];	
    $this->assertNotEquals('0000-00-00 00:00:00', $current['modified']);
    $this->assertEquals($update['username'], $current['username']);
    $this->assertEquals($update['first'], $current['first']);
    $this->assertEquals($update['last'], $current['last']);
    $this->assertEquals($update['phone'], $current['phone']);
    $this->assertEquals($update['status'], $current['status']);
    $this->assertEquals($update['gender'], $current['gender']);
    $this->assertEquals($update['occupation'], $current['occupation']);
    $this->assertEquals($update['company'], $current['company']);
    $this->assertEquals($update['website'], $current['website']);
    $this->assertEquals($update['dob'], $current['dob']);
    $this->assertEquals($update['influence'], $current['influence']);
    
    # STATS
    
    # ADDRESS
  }

  # DELETE
  /**
   * @depends testuser_post
   */    
  public function testuser_delete($model){
	  $options= array();
    $options['delete']= true;
	  
	  $r= curl("user/".$model['id'], $options);
    $this->assertEquals('deleted', $r);
	  
	  $d= oUser::get(array('id' => $model['id']));
    $this->assertEquals(404, $d);
  }
}
  
?>  