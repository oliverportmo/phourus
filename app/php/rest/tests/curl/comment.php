<?php

require '../curl.php';

class commenttest extends PHPUnit_Framework_TestCase
{
  # GET
	public function testcomment_get(){
  	// Post Comments
		$id= '1';
		$r= curl("comment/?post_id=$id");
		
		# TOTAL
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
		$this->assertEquals($id, $comment0['post_id']);
		
		$this->assertEquals(2, $comment1['id']);
		$this->assertEquals(3, $comment1['user_id']);
		$this->assertEquals($id, $comment1['post_id']);
		
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
    $c= oComment::get(array('id' => $r));
    
    # OBJECTS
    $comment= $c['comment']; 
    
    //$p= $c['post'];
    //$post= $p['post'];
    //$meta= $p['meta'];
    //$stats= $p['stats'];
    
    //$a= $p['user'];
    //$author= $a['user'];
    //$author_stats= $a['stats'];
    //$author_address= $a['address'];
    
    $u= $c['user'];
    $user= $u['user'];
    $user_stats= $u['stats'];
    $user_address= $u['address'];
    
    # ID
    /*$this->assertEquals($r, $comment['id']);
    $this->assertEquals($model['user_id'], $comment['user_id']);
    $this->assertEquals($model['user_id'], $user['id']);
    $this->assertEquals($model['user_id'], $meta['user_id']);
    $this->assertEquals($model['post_id'], $comment['post_id']);
    $this->assertEquals($model['post_id'], $post['post_id']);
       
    # DATES
    $this->assertEquals(uUtilities::now(), $comment['created']);
    $this->assertEquals('0000-00-00 00:00:00', $comment['modified']);
    
    # COMMENT
    $this->assertEquals($model['comment'], $comment['comment']);*/
    
    # USER
    
    # POST
    
    # RETURN
    $model['id']= $r;
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
    $this->assertTrue($r);
    
    $d= oComment::get(array('id' => $model['id']));
    $this->assertEquals(404, $d);
  }
}

?>