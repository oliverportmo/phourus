<?php

require '../curl.php';

class followtest extends PHPUnit_Framework_TestCase
{
  # GET
  public function testfollow_get(){
    
  }
  
  # POST
  public function testfollow_post(){
    $model= array();
    $model['user_id']= 4;
    $model['target_id']= 5;
    
    # PROCESS
    $r= curl("follow/", array('post' => $model));
    $c= oFollow::get(array('id' => $r));
    
    # ID
    $this->assertEquals($r ,$c['id']);
    $this->assertEquals($model['user_id'], $c['user_id']);
    $this->assertEquals($model['target_id'], $c['target_id']);
    
    # DATES
    //$this->assertEquals(uUtilities::now(), $c['created']);
    //$this->assertEquals('0000-00-00 00:00:00', $c['modified']);
       
    # RETURN
    $model['id']= $r;
    return $model;
  }
  
  # PUT (N/A)
  
  # DELETE
  /**
   * @depends testfollow_post
   */ 
  public function testfollow_delete($model){
    $options= array();
    $options['delete']= true;
    
    $r= curl("follow/".$model['id'], $options);
    $this->assertTrue($r);
    
    $d= oFollow::get(array('id' => $model['id']));
    $this->assertEquals(404, $d);
  }
}
  
?>