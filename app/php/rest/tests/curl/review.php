<?php
 
require '../curl.php';

class reviewtest extends PHPUnit_Framework_TestCase
{ 
  # GET
  public function testreview_get(){
    // Reviews for org
		$org_id= 1;
		$r= curl("review/?org_id=$org_id");
		
		# TOTAL
		$this->assertEquals(count($r), 5);
		
		# ID
		$this->assertEquals(4, $r[3]['review']['id']);
		$this->assertEquals(2, $r[3]['review']['user_id']);
		$this->assertEquals(2, $r[3]['user']['user']['id']);
		
		# OBJECT
		$this->assertEquals($r[3]['review']['rating'], 1);
				
		// Reviews by user
		$user_id= '2';
		$r= curl("review/?user_id=$user_id");
		
		# TOTAL
		$this->assertEquals(count($r), 2);
		
		# ID
		$this->assertEquals(4, $r[1]['review']['id']);
		$this->assertEquals($user_id, $r[0]['review']['user_id']);
		$this->assertEquals(1, $r[0]['review']['org_id']);
		
		# OBJECT
		$this->assertEquals(1, $r[1]['review']['rating']);
		$this->assertEquals('Great place to live', $r[0]['review']['title']);

  }
  
  # POST
  public function testreview_post(){
    $model= array();
    $model['org_id']= 3;
    $model['user_id']= 7;
    $model['title']= 'Test review';
    $model['content']= 'This is a test review';
    $model['rating']= 4;
    
    # PROCESS
    $r= curl("review/", array('post' => $model));
    $c= oReview::get(array('id' => $r));
    
    # OBJECTS
    $review= $c['review'];
    
    $u= $c['user'];
    $user= $u['user'];
    $stats= $u['stats'];
    $address= $u['address'];
    
    # ID
    $this->assertEquals($r, $review['id']);
    $this->assertEquals($model['org_id'], $review['org_id']);
    $this->assertEquals($model['user_id'], $review['user_id']);
    $this->assertEquals($model['user_id'], $user['id']);
    
    # DATES
    //$this->assertEquals(uUtilities::now(), $review['created']);
    //$this->assertEquals('0000-00-00 00:00:00', $review['modified']);
    
    # REVIEW
    $this->assertEquals($model['title'], $review['title']);
    $this->assertEquals($model['content'], $review['content']);
    $this->assertEquals($model['rating'], $review['rating']);
    
    # USER
   
    # RETURN
    $model['id']= $r;
    return $model;
  }

  # PUT
  /**
   * @depends testreview_post
   */
  public function testreview_put($input){
    $update= array();
    $update['content']= 'Changed review';
    
    $options= array();
		$options['put']= $update;
		
		# PROCESS
		$r= curl("review/".$input['id'], $options);
		
		# OBJECTS
		$id= $r['id'];
		$model= $r['model'];
		$original= $r['original'];
		$current= $r['current'];
		
		$this->assertEquals($update['content'], $current['content']);
  }
  
  # DELETE
  /**
   * @depends testreview_post
   */ 
  public function testreview_delete($model){
    $options= array();
    $options['delete']= true;
    
    $r= curl("review/".$model['id'], $options);
    $this->assertTrue($r);
    
    $d= oReview::get(array('id' => $model['id']));
    $this->assertEquals(404, $d);
  }
}  

?>