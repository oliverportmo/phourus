<?php

require_once '../classes/objects/oAddress.php';

class oAddressTest extends PHPUnit_Framework_TestCase
{
		public function testget(){
        			/** OTHER **
        public function testaddress(){		
      		//org address
          $params= array();
          $params['org_id']= 1;
          extract($params);
          $r= dRead::address($params);
          $this->assertEquals(count($r), 1);
          
          $this->assertEquals($r[0]['id'], 1);
          $this->assertEquals($r[0]['org_id'], $params['org_id']);
          $this->assertEquals($r[0]['user_id'], 0);
          $this->assertEquals($r[0]['street'], "80 Clay Road");
          $this->assertEquals($r[0]['city'], "Gorham");
          $this->assertEquals($r[0]['state'], "ME");
          $this->assertEquals($r[0]['country'], "US");
          $this->assertEquals($r[0]['zip'], "04038");
          $this->assertEquals($r[0]['type'], "primary");
          $this->assertEquals($r[0]['county'], null);
      
          
      		//user address
      		$params= array();
          $params['user_id']= 1;
      		extract($params);
      	  $r= dRead::address($params);
      		$this->assertEquals(count($r), 1);
          
          $this->assertEquals($r[0]['id'], 17);
          $this->assertEquals($r[0]['org_id'], 0);
          $this->assertEquals($r[0]['user_id'], $params['user_id']);
          $this->assertEquals($r[0]['street'], "650 Watertown Ave");
          $this->assertEquals($r[0]['city'], "Waterbury");
          $this->assertEquals($r[0]['state'], "CT");
          $this->assertEquals($r[0]['country'], "US");
          $this->assertEquals($r[0]['zip'], "06708");
          $this->assertEquals($r[0]['type'], "mailing");
          $this->assertEquals($r[0]['county'], null);
          
      		//address id
      		$params= array();
      		$params['id']= 4;
      		extract($params);
      		$r= dRead::address($params);
          
          $this->assertEquals($r['id'], $params['id']);
          $this->assertEquals($r['org_id'], 4);
          $this->assertEquals($r['user_id'], 0);
          $this->assertEquals($r['street'], "23 Woodward Ave");
          $this->assertEquals($r['city'], "Detroit");
          $this->assertEquals($r['state'], "MI");
          $this->assertEquals($r['country'], "US");
          $this->assertEquals($r['zip'], "48226");
          $this->assertEquals($r['type'], "primary");
          $this->assertEquals($r['county'], null);
      	}
      */
		}
		
		public function testcreate(){
  		
		}
		
		public function testupdate(){
  		
		}
		
		public function testdelete(){
  		
		}
}

?>