<?php

require_once '../classes/objects/oComment.php';

class oCommentTest extends PHPUnit_Framework_TestCase
{
  public function testget(){
    // comments for post
  	$params= array();
		$params['post_id']= 1;
		$result= oComment::get($params);
		$this->assertEquals(count($result), 4);
		
		$this->assertEquals($result[0]['comment']['post_id'], $params['post_id']);
		$this->assertEquals($result[0]['comment']['user_id'], 1);
		$this->assertEquals($result[0]['comment']['comment'], 'Phasellus cursus auctor ante, at tincidunt purus commodo ut.');
		
		$this->assertEquals($result[1]['comment']['post_id'], $params['post_id']);
		$this->assertEquals($result[1]['comment']['user_id'], 3);
		$this->assertEquals($result[1]['comment']['comment'], 'Cras venenatis malesuada erat.');
		
		// comments by user
  	$params= array();
		$params['user_id']= 1;
		$result= oComment::get($params);
		$this->assertEquals(count($result), 1);
		
		$this->assertEquals($result[0]['comment']['post_id'], 1);
		$this->assertEquals($result[0]['comment']['user_id'], $params['user_id']);
		$this->assertEquals($result[0]['comment']['comment'], 'Phasellus cursus auctor ante, at tincidunt purus commodo ut.');
		
		// comment by id
		$params= array();
		$params['id']= 1;
		$result= oComment::get($params);
		
		$this->assertEquals($result['comment']['id'], $params['id']);
		$this->assertEquals($result['comment']['post_id'], 1);
		$this->assertEquals($result['comment']['user_id'], 1);
		$this->assertEquals($result['comment']['comment'], 'Phasellus cursus auctor ante, at tincidunt purus commodo ut.');
	}
	
	public function testcreate(){
		
	}
	
	public function testupdate(){
		
	}
	
	public function testdelete(){
		
	}	
}

?>