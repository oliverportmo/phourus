<?php

require '../curl.php';

class viewtest extends PHPUnit_Framework_TestCase
{
  # GET
  public function testview_get(){
		$id= '1';
		$r= curl("view/?post_id=$id");
		$this->assertEquals(count($r), 3);
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
    $c= oView::get(array('id' => $r));
    
    # OBJECTS
    
    # ID
    $this->assertEquals($r, $c['id']);
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
    $model['id']= $r;
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
    $this->assertTrue($r);
    
    $d= oView::get(array('id' => $model['id']));
    $this->assertEquals(404, $d);
  }
}

?>