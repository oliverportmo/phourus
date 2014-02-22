<?php

require '../curl.php';

class usertest extends PHPUnit_Framework_TestCase
{
  # GET	
	/*public function testuser_get(){
		// Valid
		$id= '1';
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
		$id= 'I-DONT-EXIST';
		$r= curl("user/?id=abc");
		$this->assertEquals(404, $r);
	}*/
	
	# POST
  public function testuser_post(){
    $auth= 'dGVzdHVzZXJAcGhvdXJ1cy5jb206cGhvdXJ1cw==';
    
    $model= array();
    //$model['username']= 'jessedrelick';
    /*$model['first']= 'Jesse';
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
    $model['influence']= 44;*/
    
    # PROCESS
    $r= curl("user/", array('post' => $model, 'auth' => $auth));
    print_r($r);
    /*$c= oUser::get(array('id' => $r));
    
    # OBJECTS
    $user= $c['user'];
    $stats= $c['stats'];
    $address= $c['address'];
    
    # ID
    $this->assertEquals($c['id'], $r);
    
    # DATES
    //$this->assertEquals($c['created'], uUtilities::now());
    $this->assertEquals('0000-00-00 00:00:00', $user['modified']);
    
    # USER
    $this->assertEquals($model['username'], $user['username']);
    $this->assertEquals($model['password'], $user['password']);
    $this->assertEquals($model['first'], $user['first']);
    $this->assertEquals($model['last'], $user['last']);
    $this->assertEquals($model['email'], $user['email']);
    $this->assertEquals($model['phone'], $user['phone']);
    $this->assertEquals($model['category'], $user['category']);
    $this->assertEquals($model['subcategory'], $user['subcategory']);
    $this->assertEquals($model['status'], $user['status']);
    $this->assertEquals($model['admin'], $user['admin']);
    $this->assertEquals($model['gender'], $user['gender']);
    $this->assertEquals($model['occupation'], $user['occupation']);
    $this->assertEquals($model['company'], $user['company']);
    $this->assertEquals($model['website'], $user['website']);
    $this->assertEquals($model['fb'], $user['fb']);
    $this->assertEquals($model['li'], $user['li']);
    $this->assertEquals($model['dob'], $user['dob']);
    $this->assertEquals($model['notes'], $user['notes']);
    $this->assertEquals($model['influence'], $user['influence']);
    
    # STATS
    */
    # ADDRESS
    
    # RETURN    
    $model['id']= $r;
    return $model;
  }
  
  # PUT
  /**
   * @depends testuser_post
   */   
  public function testuser_put($input){
    $update= array();
    $update['status']= 'inactive';

    $options= array();
		$options['put']= $update;
		
		# PROCESS
		$r= curl("user/".$input['id'], $options);
		
		# OBJECTS
		$id= $r['id'];
		$model= $r['model'];
		$original= $r['original'];
		$current= $r['current'];
		
		$this->assertEquals($update['status'], $current['status']);
		
		// id, model, original, current, status
		//$this->assertEquals($input['id'], $id);
		//$this->assertEquals($model, $r['model']);
		//$this->assertEquals($original, $r['original']);
		//$this->assertTrue($r['status']); //
			
		//$this->assertEquals($update['status'], $current['status']);
		
		//$current= $r['current'];
		//$this->assertEquals($current['created'], $r['current']['created']);
    //$this->assertNotEquals($current['modified'], '0000-00-00 00:00:00');
		//$this->assertEquals($current['modified'], uUtilities::now());
		//$this->assertEquals($current['status'], $model['status']);
  }

  # DELETE
  /**
   * @depends testuser_post
   */    
  public function testuser_delete($model){
	  $options= array();
    $options['delete']= true;
	  
	  $r= curl("user/".$model['id'], $options);
	  $this->assertTrue($r);
	  
	  $d= oUser::get(array('id' => $model['id']));
    $this->assertEquals(404, $d);
  }
}
  
?>  