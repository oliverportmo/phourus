<?php

require_once 'curl.php';

class viewtest extends PHPUnit_Framework_TestCase
{
  # GET
  public function testview_get(){
		// id
		$id= 1;
		$r= curl("view/?id=$id");
		$this->assertEquals(count($r), 12);
		
		$this->assertEquals($id, $r['id']);
		$this->assertEquals('', $r['ip']);
		$this->assertEquals('', $r['path']);
		$this->assertEquals(1, $r['post_id']);
		$this->assertEquals(2, $r['viewer_id']);
		
		$this->assertNull($r['user_id']);
		$this->assertNull($r['org_id']);
		$this->assertNull($r['location']);
		$this->assertNull($r['referer']);
		$this->assertNull($r['exit']);
		
		// post_id
		$post_id= 1;
		$r= curl("view/?post_id=$post_id");
		$this->assertEquals(count($r), 3);
		
		// user_id
		$user_id= 2;
		$r= curl("view/?user_id=$user_id");
		$this->assertEquals(count($r), 2);
		
		// org_id
		$org_id= 2;
		$r= curl("view/?org_id=$org_id");
		$this->assertEquals(count($r), 3);
		
		// viewer_id
		$viewer_id= 3;
		$r= curl("view/?viewer_id=$viewer_id");
		$this->assertEquals(count($r), 4);
  }
  
  # POST
  public function testview_post(){
    $model= array();
    $model['ip']= '198.168.0.0.1';
    $model['path']= '/user/1';
    $model['post_id']= 2;
    $model['location']= 'Newport Beach';
    $model['viewer_id']= 1;
    $model['referer']= 'http://google.com';
    $model['exit']= 'http://facebook.com';
    
    # PROCESS
    $r= curl("view/", array('post' => $model));
    $c= oView::get(array('id' => $r['id']));
    
    # OBJECTS
    
    # ID
    $this->assertEquals($r['id'], $c['id']);
    $this->assertEquals($model['post_id'], $c['post_id']);
    $this->assertEquals($model['viewer_id'], $c['viewer_id']);
    
    # DATES
    //$this->assertEquals(uUtilities::now(), $c['created']);
    //$this->assertEquals('0000-00-00 00:00:00', $c['modified']);
    
    # OBJECT
    $this->assertEquals($model['ip'], $c['ip']);
    $this->assertEquals($model['path'], $c['path']);
    $this->assertEquals($model['location'], $c['location']);
    $this->assertEquals($model['referer'], $c['referer']);
    $this->assertEquals($model['exit'], $c['exit']);
    
    # RETURN
    $model['id']= $r['id'];
    return $model;
  }
  
  # PUT (N/A)
  
  # DELETE
  /**
   * @depends testview_post
   */ 
  public function testview_delete($model){
    $options= array();
    $options['delete']= true;
    
    $r= curl("view/".$model['id'], $options);
    // weird behavior preventing boolean/int from being returned from DELETE
    // using 'delete' string in place until issue can be resolved
    //$this->assertEquals(204, $r);
    $this->assertEquals('deleted', $r);
    
    $d= oView::get(array('id' => $model['id']));
    $this->assertEquals(404, $d);
  }
}

?>