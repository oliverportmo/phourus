<?php

require_once 'curl.php';

class favoritetest extends PHPUnit_Framework_TestCase
{
  # GET
  public function testfavorite_get(){
    // id
    $id= 5;
		$r= curl("favorite/?id=$id");
		$this->assertEquals(count($r), 5);
		
		$this->assertEquals($r['user_id'], 1);
		$this->assertEquals($r['target_id'], 5);

		// user_id
		$user_id= 1;
		$r= curl("favorite/?user_id=$user_id");
		$this->assertEquals(count($r), 3);
		
		$this->assertEquals($r[0]['target_id'], 4);
		$this->assertEquals($r[1]['target_id'], 5);
		$this->assertEquals($r[2]['target_id'], 6);
		
		// target_id
		$target_id= 1;
		$r= curl("favorite/?target_id=$target_id");
		$this->assertEquals(count($r), 4);
		
		$this->assertEquals($r[0]['user_id'], 2);
		$this->assertEquals($r[1]['user_id'], 4);
		$this->assertEquals($r[2]['user_id'], 6);
		$this->assertEquals($r[3]['user_id'], 8);
  }
  
  # POST
  public function testfavorite_post(){
    $model= array();
    $model['user_id']= 4;
    $model['target_id']= 5;
    
    # PROCESS
    $r= curl("favorite/", array('post' => $model));
    $c= oFavorite::get(array('id' => $r['id']));

    # ID
    $this->assertEquals($r['id'], $c['id']);
    $this->assertEquals($model['user_id'], $c['user_id']);
    $this->assertEquals($model['target_id'], $c['target_id']);
    
    # DATES
    //$this->assertEquals(uUtilities::now(), $c['created']);
    //$this->assertEquals('0000-00-00 00:00:00', $c['modified']);
       
    # RETURN
    $model['id']= $r['id'];
    return $model;
  }
  
  # PUT (N/A)
  
  # DELETE
  /**
   * @depends testfavorite_post
   */ 
  public function testfavorite_delete($model){
    $options= array();
    $options['delete']= true;
    
    $r= curl("favorite/".$model['id'], $options);
    // weird behavior preventing boolean/int from being returned from DELETE
    // using 'delete' string in place until issue can be resolved
    //$this->assertEquals(204, $r);
    $this->assertEquals('deleted', $r);
    
    $d= oFavorite::get(array('id' => $model['id']));
    $this->assertEquals(404, $d);
  }
}
  
?>