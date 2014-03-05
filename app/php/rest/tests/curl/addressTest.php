<?php

require_once 'curl.php';

class addresstest extends PHPUnit_Framework_TestCase
{
  # GET
  public function testaddress_get(){
    // id
		$id= 3;
		$r= curl("address/?id=$id");
		$this->assertEquals(count($r), 12); // 12 fields for single
		
		$this->assertEquals($id, $r['id']);
		$this->assertEquals(3, $r['org_id']);
		$this->assertEquals(0, $r['user_id']);
		$this->assertEquals("68 University Ave", $r['street']);
		$this->assertEquals("Des Moines", $r['city']);
		$this->assertEquals("IA", $r['state']);
		$this->assertEquals("US", $r['country']);
		$this->assertEquals("50314", $r['zip']);
		$this->assertEquals("primary", $r['type']);
		$this->assertNull($r['county']);
		
		// user_id
		$user_id= 4;
		$r= curl("address/?user_id=$user_id");
		$this->assertEquals(count($r), 1);
		$r= $r[0];
		
		$this->assertEquals(20, $r['id']);
		$this->assertEquals(0, $r['org_id']);
		$this->assertEquals($user_id, $r['user_id']);
		$this->assertEquals("102 Ash Rd", $r['street']);
		$this->assertEquals("Louisa", $r['city']);
		$this->assertEquals("VA", $r['state']);
		$this->assertEquals("US", $r['country']);
		$this->assertEquals("23093", $r['zip']);
		$this->assertEquals("mailing", $r['type']);
		$this->assertNull($r['county']);		

		// org_id
		$org_id= 7;
		$r= curl("address/?org_id=$org_id");
		$this->assertEquals(count($r), 1);
		$r= $r[0];
		
		$this->assertEquals(7, $r['id']);
		$this->assertEquals(7, $r['org_id']);
		$this->assertEquals(0, $r['user_id']);
		$this->assertEquals("561 Broadway Blvd", $r['street']);
		$this->assertEquals("Kansas City", $r['city']);
		$this->assertEquals("MO", $r['state']);
		$this->assertEquals("US", $r['country']);
		$this->assertEquals("64105", $r['zip']);
		$this->assertEquals("residential", $r['type']);
		$this->assertNull($r['county']);	

    // none
  }
  
  # POST
  public function testaddress_post(){
    $model= array();
    $model['org_id']= 6;
    $model['user_id']= 2;
    $model['street']= '123 Fake Street';
    $model['city']= 'Boston';
    $model['state']= 'MA';
    $model['country']= 'US';
    $model['zip']= '03856';
    $model['type']= 'primary';
    $model['county']= 'Middlesex';
    
    # PROCESS
    $r= curl("address/", array('post' => $model));
    $c= oAddress::get(array('id' => $r['id']));
    
    # ID
    $this->assertEquals($c['id'], $r['id']);
    $this->assertEquals($c['org_id'], $model['org_id']);
    $this->assertEquals($c['user_id'], $model['user_id']);
    
    # DATES
    //$this->assertEquals($c['created'], uUtilities::now());
    //$this->assertEquals($c['modified'], '0000-00-00 00:00:00');
    
    # OBJECT
    $this->assertEquals($c['street'], $model['street']);
    $this->assertEquals($c['city'], $model['city']);
    $this->assertEquals($c['state'], $model['state']);
    $this->assertEquals($c['country'], $model['country']);
    $this->assertEquals($c['zip'], $model['zip']);
    $this->assertEquals($c['type'], $model['type']);
    $this->assertEquals($c['county'], $model['county']);
    
    # RETURN
    $model['id']= $r['id'];
    return $model;
  }
  
  # PUT
  /**
   * @depends testaddress_post
   */ 
  public function testaddress_put($input){
    $update= array();
    $update['city']= 'New city';
    
    $options= array();
		$options['put']= $update;
		
		# PROCESS
		$r= curl("address/".$input['id'], $options);
		
		# OBJECTS
		$id= $r['id'];
		$model= $r['model'];
		$original= $r['original'];
		$current= $r['current'];
		
		$this->assertEquals($update['city'], $current['city']);
  }
  
  # DELETE
  /**
   * @depends testaddress_post
   */ 
  public function testaddress_delete($model){
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
}  

?>