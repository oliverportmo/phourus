<?php

require_once 'curl.php';

class commenttest extends PHPUnit_Framework_TestCase
{
  # GET
	public function testcomment_get(){
  	// id
  	$id= 5;
  	$r= curl("comment/?id=$id");
		$this->assertEquals(2, count($r));
		
		$u= $r['user'];
		
		$comment= $r['comment'];
		$user= $u['user'];
		$stats= $u['stats'];
		$address= $u['address'][0];
		
		$this->assertEquals(2, $comment['user_id']);
		$this->assertEquals(1, $comment['post_id']);
		
		$this->assertEquals(2, $user['id']);
		$this->assertEquals('Kelly', $user['first']);
		$this->assertEquals('Basil', $user['last']);
		$this->assertEquals('kbasil@phourus.com', $user['email']);
		$this->assertEquals('555-555-5555', $user['phone']);

		$this->assertEquals(2, $stats['comments']);
		$this->assertEquals(70, $stats['popularity']);
		
		$this->assertEquals("480 Sherman Rd", $address['street']);
		$this->assertEquals('19064', $address['zip']);
		
		$this->assertEquals("Fusce dolor sapien, sagittis ut varius at, dignissim a nunc. Donec vel erat vitae magna aliquet commodo non non magna.", $comment['comment']);
		
  	// user_id
  	  	
  	// post_id
		$post_id= 1;
		$r= curl("comment/?post_id=$post_id");
		$this->assertEquals(4, count($r));
		
		# OBJECTS
		$comment0= $r[0]['comment'];
		$user0= $r[0]['user'];
		$comment1= $r[1]['comment'];
		$user1= $r[1]['user'];
		
		# ID
		$this->assertEquals(1, $user0['user']['id']);
		$this->assertEquals(3, $user1['user']['id']);
		
		$this->assertEquals(1, $comment0['id']);
		$this->assertEquals(1, $comment0['user_id']);
		$this->assertEquals($post_id, $comment0['post_id']);
		
		$this->assertEquals(2, $comment1['id']);
		$this->assertEquals(3, $comment1['user_id']);
		$this->assertEquals($post_id, $comment1['post_id']);
		
		# COMMENT
		$this->assertEquals($comment0['comment'], 'Phasellus cursus auctor ante, at tincidunt purus commodo ut.');
		$this->assertEquals($comment1['comment'], 'Cras venenatis malesuada erat.');
	}
	
	# POST
  public function testcomment_post(){
    $model= array();
    $model['user_id']= 8;
    $model['post_id']= 7;
    $model['comment']= 'This is a test comment.';
    
    # PROCESS
    $r= curl("comment/", array('post' => $model));
    $c= oComment::get(array('id' => $r['id']));
    
    # OBJECTS
    $comment= $c['comment']; 
  
    # USER
    $u= $c['user'];
    $user= $u['user'];
    $user_stats= $u['stats'];
    $user_address= $u['address'];
    
    # ID
    $this->assertEquals($r['id'], $comment['id']);
    $this->assertEquals($model['user_id'], $comment['user_id']);
    $this->assertEquals($model['post_id'], $comment['post_id']);
    $this->assertEquals($model['user_id'], $user['id']);
       
    # DATES
    //$this->assertEquals(uUtilities::now(), $comment['created']);
    $this->assertEquals('0000-00-00 00:00:00', $comment['modified']);
    
    # COMMENT
    $this->assertEquals($model['comment'], $comment['comment']);
        
    # RETURN
    $model['id']= $r['id'];
    return $model;
  }
  
  # PUT
  /**
   * @depends testcomment_post
   */ 
  public function testcomment_put($input){
    $update= array();
    $update['comment']= 'Changed comment';
    
    $options= array();
		$options['put']= $update;
		
		# PROCESS
		$r= curl("comment/".$input['id'], $options);
		
		# OBJECTS
		$id= $r['id'];
		$model= $r['model'];
		$original= $r['original'];
		$current= $r['current'];
		
		$this->assertEquals($update['comment'], $current['comment']);
  }
  
  # DELETE
  /**
   * @depends testcomment_post
   */ 
  public function testcomment_delete($model){
    $options= array();
    $options['delete']= true;
    
    $r= curl("comment/".$model['id'], $options);
    // weird behavior preventing boolean/int from being returned from DELETE
    // using 'delete' string in place until issue can be resolved
    //$this->assertEquals(204, $r);
    $this->assertEquals('deleted', $r);
    
    $d= oComment::get(array('id' => $model['id']));
    $this->assertEquals(404, $d);
  }
}

?>