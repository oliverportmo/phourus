<?php

require_once 'curl.php';

class thumbtest extends PHPUnit_Framework_TestCase
{
  # GET
  public function testthumb_get(){
    // id
		$id= 7;
		$r= curl("thumb/?id=$id");
		$this->assertEquals(count($r), 6);
		
		$this->assertEquals($id, $r['id']);
		$this->assertEquals(4, $r['post_id']);
		$this->assertEquals(7, $r['user_id']);
		$this->assertEquals(0, $r['positive']);
		
		// post_id
		$post_id= 1;
		$r= curl("thumb/?post_id=$post_id");
		$this->assertEquals(count($r), 3);
		
		// user_id
		$user_id= 2;
		$r= curl("thumb/?user_id=$user_id");
		$this->assertEquals(count($r), 1);
		
		// user_id + post_id
		$user_id= 3;
		$post_id= 4;
		$r= curl("thumb/?user_id=$user_id&post_id=$post_id");
		$this->assertEquals(count($r), 1);
  }
  
  # POST
  public function testthumb_post(){
    $model= array();
    $model['post_id']= 7;
    $model['user_id']= 6;
    $model['positive']= 1;
    
    # PROCESS
    $r= curl("thumb/", array('post' => $model));
    $c= oThumb::get(array('id' => $r['id']));
    
    # OBJECTS
    
    # ID
    $this->assertEquals($r['id'], $c['id']);
    $this->assertEquals($model['post_id'], $c['post_id']);
    $this->assertEquals($model['user_id'], $c['user_id']);
    
    # DATES
    //$this->assertEquals(uUtilities::now(), $c['created']);
    //$this->assertEquals('0000-00-00 00:00:00', $c['modified']);
    
    # OBJECT
    $this->assertEquals($model['positive'], $c['positive']);
    
    # RETURN
    $model['id']= $r['id'];
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
    // weird behavior preventing boolean/int from being returned from DELETE
    // using 'delete' string in place until issue can be resolved
    //$this->assertEquals(204, $r);
    $this->assertEquals('deleted', $r);
    
    $d= oThumb::get(array('id' => $model['id']));
    $this->assertEquals(404, $d);
  }
}  
  
?>