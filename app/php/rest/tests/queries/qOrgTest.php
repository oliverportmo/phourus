<?php 

class qOrgTest extends PHPUnit_Framework_TestCase
{

  # org
	public function testorg(){
  	// type = 'companies'
  	$params= array();
  	$params['type']= 'companies';	
  	$modified= 'company';
  	$query= sprintf("SELECT * FROM `%s` WHERE %s.type = '%s' ORDER BY %s.influence DESC;", TABLE_ORGS, TABLE_ORGS, $modified, TABLE_ORGS);
		$this->assertEquals($query, qOrg::org($params));	
		
  	// id = '4'
  	$params= array();
  	$params['id']= '4';	
  	$query= sprintf("SELECT * FROM `%s` WHERE id = %d ORDER BY %s.influence DESC;", TABLE_ORGS, $params['id'], TABLE_ORGS);
		$this->assertEquals($query, qOrg::org($params));	
		
  	// type && id
  	$params= array();
  	$params['id']= '4';	
  	$params['type']= 'companies';	
  	
  	$query= sprintf("SELECT * FROM `%s` WHERE id = %d ORDER BY %s.influence DESC;", TABLE_ORGS, $params['id'], TABLE_ORGS);
		$this->assertEquals($query, qOrg::org($params));	
		
		// type, id, mode = id
		$params= array();
		$params['id']= '4';	
  	$params['type']= 'companies';	
  	$params['mode']= 'id';	
  	
		$query= sprintf("SELECT id FROM `%s` WHERE id = %d ORDER BY %s.influence DESC;", TABLE_ORGS, $params['id'], TABLE_ORGS);
		$this->assertEquals($query, qOrg::org($params));
	}
	
	# stats
	public function teststats(){
  	// org_id
  	$org_id= 3;
  	//$query= sprintf("SELECT * FROM `%s` WHERE id = %d;", TABLE_USERS, $org_id);
  	//$this->assertEquals($query, qOrg::org_stats($org_id));
	}
	
	# posts
	public function testposts(){
  	
	}
	
	# states
	public function teststates(){
  	
	}
	
  # community
	public function community(){
  	$query= sprintf("SELECT %s FROM `%s` %s %s %s;", $fields, TABLE_MEMBERS, $users, $where, $filter);
	}
	
  # clout
	public function testclout(){
	  // org
		$params= array();
    $params['org_id']= 1;
	  $query= sprintf("SELECT * FROM `%s` WHERE org_id = %d;", TABLE_CLOUT, $params['org_id']);
		$this->assertEquals($query, qOrg::clout($params));
	}
	
	# reviews
	public function testreviews(){
	  $default_limit= 20;
	  // all reviews for org
	  $params= array();
	  $params['org_id']= 1; 
	  $query= sprintf("SELECT * FROM `%s` WHERE org_id = %d LIMIT %d, %d;", TABLE_REVIEWS, $params['org_id'], 0, $default_limit);
		$this->assertEquals($query, qOrg::reviews($params));
		
		// all reviews by user
		$params= array();
    $params['user_id']= 1;
	  $query= sprintf("SELECT * FROM `%s` WHERE user_id = %d LIMIT %d, %d;", TABLE_REVIEWS, $params['user_id'], 0, $default_limit);
		$this->assertEquals($query, qOrg::reviews($params));
		
		// paging
		$params= array();
		$params['limit']= 20;
		$params['page']= 2;
		$params['org_id']= 1;
		$query= sprintf("SELECT * FROM `%s` WHERE org_id = %d LIMIT %d, %d;", TABLE_REVIEWS, $params['org_id'], $params['limit'] * ($params['page'] - 1), $params['limit']);
		$this->assertEquals($query, qOrg::reviews($params));
	}
}

?>