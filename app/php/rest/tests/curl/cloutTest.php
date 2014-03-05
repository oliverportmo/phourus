<?php 

require_once 'curl.php';

class clouttest extends PHPUnit_Framework_TestCase
{
  # GET
  public function testclout_get(){
    // id
    $id= 3;
		$r= curl("clout/?id=$id");
		$this->assertEquals(count($r), 9);
		
		$this->assertEquals($id, $r['id']);
		$this->assertEquals(1, $r['org_id']);
		$this->assertEquals('press', $r['type']);
		$this->assertEquals('CNN', $r['title']);
		$this->assertEquals('2012-07-09', $r['date']);
		$this->assertNull($r['image']);

    // org_id
		$org_id= 1;
		$r= curl("clout/?org_id=$org_id");
		$this->assertEquals(count($r), 8);
		
		$this->assertEquals($org_id, $r[2]['org_id']);
		$this->assertEquals($r[4]['type'], 'award');
		$this->assertEquals($r[2]['title'], 'CNN');
		$this->assertEquals($r[3]['id'], 4);
		$this->assertEquals($r[5]['date'], "2012-11-15");	
  }
  
  # POST
  public function testclout_post(){
    $model= array();
    $model['org_id']= 4;
    $model['type']= 'press';
    $model['title']= 'Sample Clout';
    $model['date']= '2012-08-03';
    $model['content']= 'This is a sample clout entry.';
    $model['image']= '/assets/clout';
    
    # PROCESS
    $r= curl("clout/", array('post' => $model));
    $c= oClout::get(array('id' => $r['id']));
    
    # OBJECTS
    
    # ID
    $this->assertEquals($r['id'], $c['id']);
    $this->assertEquals($model['org_id'], $c['org_id']);
    
    # DATES
    //$this->assertEquals(uUtilities::now(), $c['created']);
    //$this->assertEquals('0000-00-00 00:00:00', $c['modified']);
    
    # OBJECT
    $this->assertEquals($model['type'], $c['type']);
    $this->assertEquals($model['title'], $c['title']);
    $this->assertEquals($model['date'], $c['date']);
    $this->assertEquals($model['content'], $c['content']);
    $this->assertEquals($model['image'], $c['image']);
    
    $model['id']= $r['id'];
    return $model;
  }
  
  # PUT
  /**
   * @depends testclout_post
   */
  public function testclout_put($input){
    $update= array();
    $update['title']= 'Changed clout';
    
    $options= array();
		$options['put']= $update;
		
		# PROCESS
		$r= curl("clout/".$input['id'], $options);
		
		# OBJECTS
		$id= $r['id'];
		$model= $r['model'];
		$original= $r['original'];
		$current= $r['current'];
		
		$this->assertEquals($update['title'], $current['title']);
  }
  
  # DELETE
  /**
   * @depends testclout_post
   */ 
  public function testclout_delete($model){
    $options= array();
    $options['delete']= true;
    
    $r= curl("clout/".$model['id'], $options);
    // weird behavior preventing boolean/int from being returned from DELETE
    // using 'delete' string in place until issue can be resolved
    //$this->assertEquals(204, $r);
    $this->assertEquals('deleted', $r);
    
    $d= oClout::get(array('id' => $model['id']));
    $this->assertEquals(404, $d);
  }
}
?>