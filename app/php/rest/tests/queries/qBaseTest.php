<?php 

class qBaseTest extends PHPUnit_Framework_TestCase
{
	# get
  public function testget(){ 

	}
	
	# create
	public function testcreate(){ 
		$type= 'views';
		
		$model= array();
		$model['id']= '1';
		$model['created']= '';
		$model['modified']= '';
		$model['string']= 'I am a string';
		$model['int']= 123;
		$model['undefined']= 'undefined';
		$params= uUtilities::pairs($model);
		
		$query= sprintf("INSERT INTO `%s` (`id`, `created`, `modified`, `string`, `int`, `undefined`) VALUES (%d, NULL, NOW(), '%s', '%s', '');", TABLE_VIEWS, $model['id'], $model['string'], $model['int']);
		$this->assertEquals($query, qBase::create($model, $type));
	}
	
	# update
	public function testupdate(){ 
		$params= array();
		$params['id']= '1';
		$params['user_id']= 5;
		$params['post_id']= 76;
		$params['content']= 'Test comment';
		$query= sprintf("UPDATE `%s` SET `user_id` = %d, `post_id` = %d, `content` = '%s', `modified` = NOW() WHERE id = %d;", TABLE_COMMENTS, $params['user_id'], $params['post_id'], $params['content'], $params['id']);
		$this->assertEquals($query, qBase::update($params['id'], 'comments', $params));
	}
		
  # delete
	public function testdelete(){ 
		/*$params= array();
		$params['id']= '1';
		$query= sprintf("UPDATE `%s` SET privacy = '-1', modified = NOW() WHERE id = %d;", TABLE_POSTS, $params['id']);
		$this->assertEquals($query, qBase::delete($params));*/
	}
}

?>