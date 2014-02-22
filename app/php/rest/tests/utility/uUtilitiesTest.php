<?php

require_once '../../../php/rest/classes/utility/uUtilities.php';

class uUtilitiesTest extends PHPUnit_Framework_TestCase
{
	
	public function testtable(){
INSERT INTO _app_tags (`id`, `modified`, `tag`, `target`) VALUES ('', '', 'testtag', 3);
UPDATE _app_tags SET `modified` = NOW(), `tag` = 'tag2', `target` = 2 WHERE `id` = 24;

	}
	
	public function testtoken(){

	}
	
	public function testexpires(){

	}
	
	public function testdecode(){

	}
	
	public function testemail(){

	}
	
	public function testpairs(){
		// Standard fields
		$model= array();
		$model['string']= 'I am just a string';
		$model['int']= 123;
		$model['another']= 'gaeghagas';
		
		$pairs= uUtilities::pairs($model);
		$keys= "`string`, `int`, `another`";
		$values= "'".$model['string']."', '".$model['int']."', '".$model['another']."'";
		
		var_dump($pairs);
		$this->assertEquals($keys, $pairs['keys']);
		$this->assertEquals($values, $pairs['values']);	
		
		// Special fields
		$model= array();
		$model['id']= '';
		$model['created']= 'NOW()';
		$model['modified']= '';
		$model['undefined']= 'undefined';
		
		$pairs= uUtilities::pairs($model);
		$keys= "`id`, `created`, `modified`, `undefined`";
		$values= "'', NOW(), '', ''";
		
		$this->assertEquals($keys, $pairs['keys']);
		$this->assertEquals($values, $pairs['values']);	
				
	}
	
	public function testvalues(){
		/** id **/
		// id = ''
		$id= uUtilities::values('id', '');
		$this->assertEquals($id, "''");
		
		// id = 'undefined'
		$id= uUtilities::values('id', 'undefined');
		$this->assertEquals($id, "''");
		
		// id = '123'
		$id= uUtilities::values('id', '123');
		$this->assertEquals($id, "123");
		
		/** post_id **/
		// post_id = LAST_INSERT_ID()
		$post_id= uUtilities::values('post_id', 'LAST_INSERT_ID()');
		$this->assertEquals($post_id, 'LAST_INSERT_ID()');
		
		// post_id = 123
		$post_id= uUtilities::values('post_id', 123);
		$this->assertEquals($post_id, '123');
		
		// post_id = ''
		$post_id= uUtilities::values('post_id', '');
		$this->assertEquals($post_id, '');
		
		/** created **/
		// created = ''
		$created= uUtilities::values('created', '');
		$this->assertEquals($created, "''");
		
		// created = '123'
		$created= uUtilities::values('created', '123');
		$this->assertEquals($created, "'123'");
		
		// created = NOW()
		$created= uUtilities::values('created', 'NOW()');
		$this->assertEquals($created, "NOW()");
		
		/** modified **/
		// created = ''
		$modified= uUtilities::values('modified', '');
		$this->assertEquals($modified, "NOW()");
		
		// created = '123'
		$modified= uUtilities::values('modified', '123');
		$this->assertEquals($modified, "'123'");
		
		/** default **/

	}
}

?>