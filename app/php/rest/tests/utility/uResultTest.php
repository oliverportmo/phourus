<?php

require_once '../../../php/rest/classes/utility/uResult.php';

class uResultTest extends PHPUnit_Framework_TestCase
{
		
	public function testdb(){
		$results= new uResult();
		$this->assertTrue($results->db() instanceof PDO);	
	}
		
	public function testr_read(){
		$results= new uResult();

		// single
		$id= "1";
		$q= "SELECT * FROM app_users WHERE id= '$id';";
		$r= $results->r_single($q);
		//$this->assertEquals($id, $r['id']);
		
		// collection
		$q= "SELECT * FROM app_users;";
		$r= $results->r_read($q);
		$total= count($r);
		//$this->assertEquals($total, 7);
				
		// error
		$q= "SELECT * FROM missing_table;";
		$r= $results->r_read($q);
		//$this->assertTrue($r['error']);	
		//$this->assertFalse($r);	
	}
	
	public function testr_single(){
  	
	}
	
	public function testr_create(){
		
	}
	
	public function testr_update(){

	}
	
	public function testr_delete(){

	}
	
	public function testr_login(){

	}
}

?>