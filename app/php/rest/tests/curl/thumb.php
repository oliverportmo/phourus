<?php

require '../curl.php';

class thumbtest extends PHPUnit_Framework_TestCase
{
  # GET
  public function testthumb_get(){
    
  }
  
  # POST
  public function testthumb_post(){
    $model= array();
    $model['post_id']= 7;
    $model['user_id']= 6;
    $model['positive']= 1;
    
    # PROCESS
    $r= curl("thumb/", array('post' => $model));
    $c= oThumb::get(array('id' => $r));
    
    # OBJECTS
    
    # ID
    $this->assertEquals($r, $c['id']);
    $this->assertEquals($model['post_id'], $c['post_id']);
    $this->assertEquals($model['user_id'], $c['user_id']);
    
    # DATES
    //$this->assertEquals(uUtilities::now(), $c['created']);
    //$this->assertEquals('0000-00-00 00:00:00', $c['modified']);
    
    # OBJECT
    $this->assertEquals($model['positive'], $c['positive']);
    
    # RETURN
    $model['id']= $r;
    return $model;
  }
  
  # PUT
  /**
   * @depends testthumb_post
   */ 
  public function testthumb_put($input){
    $update= array();
    $update['positive']= 0;
    
    $options= array();
		$options['put']= $update;
		
		# PROCESS
		$r= curl("thumb/".$input['id'], $options);
		
		# OBJECTS
		$id= $r['id'];
		$model= $r['model'];
		$original= $r['original'];
		$current= $r['current'];
		
		$this->assertEquals($update['positive'], $current['positive']);
  }
  
  # DELETE
  /**
   * @depends testthumb_post
   */ 
  public function testthumb_delete($model){
    $options= array();
    $options['delete']= true;
    
    $r= curl("thumb/".$model['id'], $options);
    $this->assertTrue($r);
    
    $d= oThumb::get(array('id' => $model['id']));
    $this->assertEquals(404, $d);
  }
}  
  
?>