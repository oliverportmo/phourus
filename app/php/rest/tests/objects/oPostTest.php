<?php

require_once '../classes/objects/oPost.php';

class oPostTest extends PHPUnit_Framework_TestCase
{
	
	public function testget(){
    /** CORE **
    	public function testposts(){
    		// count, 
    		
    		// minimal
    		$params= array();
    		$r= dRead::posts($params);
    		$this->assertEquals(count($r), 2);
    		
    		// limit
    		$params= array();
    		$params['limit']= 3;
    		$r= dRead::posts($params);
    		$this->assertEquals(count($r), 2);	
    		
    		// 
    		$params= array();
    		$params['types']= 'blogs'; 
    		$params['field']= 'id';
    		$params['asc']= true;
    		$params['page']= 0;
    		$params['limit']= 20;
    		$params['mode']= 'phourus';
    		$r= dRead::posts($params);
    		$this->assertEquals(count($r), 2);	
    	}
    	
    	public function testpost(){
    		// Valid
    		$id= 2;
    		$result= dRead::post($id);
    		$this->assertEquals($id, $result['id']);
    		
    		// Invalid ID
    		$id= "I-DONT-EXIST";
    		$result= dRead::post($id);
    		$this->assertEquals(404, $result);
    	}	
    	
    	public function testmeta(){
    		// Valid
    		$post_id= 40;
    		$type= 'blogs';
    		$result= dRead::meta($post_id, $type);
    		$this->assertEquals($post_id, $result);
    		
    		// Invalid type
    		$post_id= 20;
    		$type= 'asgas';
    		$result= dRead::meta($post_id, $type);
    		$this->assertEquals(404, $result);
    		
    		// Invalid ID
    		$missing= 'I-DONT-EXIST';
    		$result= dRead::meta($missing, $type);
    		$this->assertEquals(404, $result);
    	}
    */
	}

	public function testcreate(){
		
	}
	
	public function testupdate(){
		
	}
	
	public function testdelete(){
		
	}
	
	/** PARAMS **/
	
	public function testparams(){
		
	}
	
	public function testmode(){
  	
	}
	
	public function testtypes(){
		
	}
	
	public function testorder(){
		
	}
	
	public function testpaging(){
		
	}
	
	public function testauthor(){
  	
	}
	
	public function testselector(){
		
	}
	
	public function testadvanced(){
		
	}
	
	public function teststats(){
  	
	}
	
	public function testcomments(){
  	
	}
	
}

?>