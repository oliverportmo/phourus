<?php
 
require '../curl.php';

class tagtest extends PHPUnit_Framework_TestCase
{  
  # GET
  public function testtag_get(){
    // By id
		$id= 1;
		$r= curl("tag/?id=$id");
		$this->assertEquals(count($r), 5);
		$this->assertEquals($r['id'], 1);
		$this->assertEquals($r['created'], '0000-00-00 00:00:00');
		$this->assertEquals($r['modified'], '0000-00-00 00:00:00');
		$this->assertEquals($r['post_id'], 1);
		$this->assertEquals($r['tag'], 'school');
		
		// By post_id
		$post_id= 1;
		$r= curl("tag/?post_id=$post_id");
		$this->assertEquals(count($r), 3);
		
		$this->assertEquals($r[0]['id'], 1);
		$this->assertEquals($r[1]['id'], 2);
		$this->assertEquals($r[2]['id'], 5);
		
		$this->assertEquals($r[0]['created'], '0000-00-00 00:00:00');
		$this->assertEquals($r[1]['created'], '0000-00-00 00:00:00');
		$this->assertEquals($r[2]['created'], '0000-00-00 00:00:00');
		
		$this->assertEquals($r[0]['modified'], '0000-00-00 00:00:00');
		$this->assertEquals($r[1]['modified'], '0000-00-00 00:00:00');
		$this->assertEquals($r[2]['modified'], '0000-00-00 00:00:00');
		
		$this->assertEquals($r[0]['post_id'], $post_id);
		$this->assertEquals($r[1]['post_id'], $post_id);
		$this->assertEquals($r[2]['post_id'], $post_id);
		
		$this->assertEquals($r[0]['tag'], 'school');
		$this->assertEquals($r[1]['tag'], 'budget');
		$this->assertEquals($r[2]['tag'], 'education');	
  }
  
  # POST
  public function testtag_post(){
    $model= array();
    $model['post_id']= 3;
    $model['tag']= 'unit test tag';
    
    # PROCESS
    $r= curl("tag/", array('post' => $model));
    $c= oTag::get(array('id' => $r));
    
    # ID
    $this->assertEquals($c['id'], $r);
    $this->assertEquals($c['post_id'], $model['post_id']);
    
    # DATES
    //$this->assertEquals($c['created'], uUtilities::now());
    //$this->assertEquals($c['modified'], '0000-00-00 00:00:00');
    
    # OBJECT
    $this->assertEquals($c['tag'], $model['tag']);
    
    # RETURN
    $model['id']= $r;
    return $model;
  }
  
  # PUT (N/A)
  
  # DELETE
  /**
   * @depends testtag_post
   */ 
  public function testtag_delete($model){
    $options= array();
    $options['delete']= true;
    
    $r= curl("tag/".$model['id'], $options);
    $this->assertTrue($r);
    
    $d= oTag::get(array('id' => $model['id']));
    $this->assertEquals(404, $d);
  }
}

?>