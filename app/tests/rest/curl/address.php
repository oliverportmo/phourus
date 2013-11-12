<?php

require '../curl.php';

class addresstest extends PHPUnit_Framework_TestCase
{
  # GET
  public function testaddress_get(){
    
  }
  
  # POST
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
    
    # PROCESS
    $r= curl("address/", array('post' => $model));
    $c= oAddress::get(array('id' => $r));
    
    # ID
    $this->assertEquals($c['id'], $r);
    $this->assertEquals($c['org_id'], $model['org_id']);
    $this->assertEquals(0, $c['user_id']);
    
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
    $model['id']= $r;
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
    $this->assertTrue($r);
    
    $d= oAddress::get(array('id' => $model['id']));
    $this->assertEquals(404, $d);
  }
}  

?>