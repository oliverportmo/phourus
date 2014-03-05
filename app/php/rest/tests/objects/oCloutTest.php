<?php

require_once '../classes/objects/oClout.php';

class oCloutTest extends PHPUnit_Framework_TestCase
{
    public function testget(){
      // clout for org
    	$params= array();
  		$params['org_id']= 1;
  		$r= oClout::get($params);
  		$this->assertEquals(count($r), 8);
  		
  		$this->assertEquals($r[0]['org_id'], $params['org_id']);
  		$this->assertEquals($r[1]['org_id'], $params['org_id']);
  		$this->assertEquals($r[2]['org_id'], $params['org_id']);
  		$this->assertEquals($r[3]['org_id'], $params['org_id']);
  		$this->assertEquals($r[4]['org_id'], $params['org_id']);
  		$this->assertEquals($r[5]['org_id'], $params['org_id']);
  		$this->assertEquals($r[6]['org_id'], $params['org_id']);
  		$this->assertEquals($r[7]['org_id'], $params['org_id']);
  		
  		$this->assertEquals($r[0]['type'], 'press');
  		$this->assertEquals($r[2]['title'], 'CNN');
  		$this->assertEquals($r[4]['content'], 'At mei civibus blandit, adhuc consequuntur te eam, eu sed mazim perfecto efficiantur.');
  		$this->assertEquals($r[5]['date'], '2012-11-15');
  		$this->assertEquals($r[7]['id'], 8);
		}
		
		public function testcreate(){
  		
		}
		
		public function testupdate(){
  		
		}
		
		public function testdelete(){
  		
		}
}

?>