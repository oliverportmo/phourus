<?php

require_once '../../../php/rest/classes/data/dRead.php';
require_once '../../../php/rest/classes/objects/oAddress.php';
require_once '../../../php/rest/classes/objects/oClout.php';
require_once '../../../php/rest/classes/objects/oComment.php';
require_once '../../../php/rest/classes/objects/oFollow.php';
require_once '../../../php/rest/classes/objects/oOrg.php';
require_once '../../../php/rest/classes/objects/oPost.php';
require_once '../../../php/rest/classes/objects/oReview.php';
require_once '../../../php/rest/classes/objects/oSession.php';
require_once '../../../php/rest/classes/objects/oStats.php';
require_once '../../../php/rest/classes/objects/oThumb.php';
require_once '../../../php/rest/classes/objects/oUser.php';
require_once '../../../php/rest/classes/objects/oView.php';
require_once '../../../php/rest/classes/utility/uResult.php';
require_once '../../../php/rest/classes/utility/uQueries.php';
require_once '../../../php/rest/classes/utility/uUtilities.php';

class dReadTest extends PHPUnit_Framework_TestCase
{
	
	/** CORE **/
	public function testposts(){
		$params= array();
		$params['types']= 'blogs'; 
		$params['field']= 'id';
		$params['asc']= true;
		$params['page']= 0;
		$params['limit']= 20;
		$params['mode']= 'phourus';
		$r= dRead::posts($params);
		//$this->assertEquals(count($r), 2);	
	}
	
	public function testmeta(){
		// Valid
		$post_id= '1';
		$result= dRead::meta($post_id);
		$this->assertEquals($post_id, $result['id']);
		
		// Invalid
		$missing= 'I-DONT-EXIST';
		//$result= dRead::meta($missing);
		$total= count($result);
		//$this->assertEquals($total, 0);
	}
	
	public function testpost(){
		// Valid
		$post_id= "2";
		$type= 'blogs';
		$result= dRead::post($post_id, $type);
		//$this->assertEquals($id, $result['post_id']);
		
		// Invalid Type	
		$id= "1";
		$type= 'missing';
		$result= dRead::post($id, $type);
		$this->assertEquals(400, $result);
		
		// Invalid ID
		$id= "I-DONT-EXIST";
		$type= 'blogs';
		$result= dRead::post($id, $type);
		$this->assertEquals(404, $result);
	}	
	
	public function testusers(){
	  $params= array();
  	$q= uQueries::users($params);
  	$result= new uResult();
  	$out= $result->r_read($q);
  	return $out;
	}
				
	public function testorgs(){
	  $params= array();
  	$q= uQueries::orgs($params);
  	$result= new uResult();
  	$out= $result->r_read($q);
  	return $out;
	}
	
  /** META **/
	public function testviews(){

	}
	
	public function testthumbs(){

	}
	
	public function testcomments(){
  	// comments for post
  	$params= array();
		$params['post_id']= 1;
		$result= dRead::comments($params);
		$this->assertEquals(count($result), 4);
		
		$this->assertEquals($result[0]['post_id'], $params['post_id']);
		$this->assertEquals($result[0]['user_id'], 1);
		$this->assertEquals($result[0]['comment'], 'Phasellus cursus auctor ante, at tincidunt purus commodo ut.');
		
		$this->assertEquals($result[1]['post_id'], $params['post_id']);
		$this->assertEquals($result[1]['user_id'], 3);
		$this->assertEquals($result[1]['comment'], 'Cras venenatis malesuada erat.');
		
		// comments by user
  	$params= array();
		$params['user_id']= 1;
		$result= dRead::comments($params);
		$this->assertEquals(count($result), 1);
		
		$this->assertEquals($result[0]['post_id'], 1);
		$this->assertEquals($result[0]['user_id'], $params['user_id']);
		$this->assertEquals($result[0]['comment'], 'Phasellus cursus auctor ante, at tincidunt purus commodo ut.');
		
		// comment by id
		$params= array();
		$params['id']= 1;
		$result= dRead::comments($params);
		
		$this->assertEquals($result['id'], $params['id']);
		$this->assertEquals($result['post_id'], 1);
		$this->assertEquals($result['user_id'], 1);
		$this->assertEquals($result['comment'], 'Phasellus cursus auctor ante, at tincidunt purus commodo ut.');
	}

	public function testfollows(){

	}
	
	/** ORGS **/
	public function testclout(){
  	// clout for org
  	$params= array();
		$params['org_id']= 1;
		$r= dRead::clout($params);
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
	
	public function testreviews(){
  	// reviews for org
  	$params= array();
		$params['org_id']= 1;
		$r= dRead::reviews($params);
		$this->assertEquals(count($r), 5);
		
		$this->assertEquals($r[0]['org_id'], $params['org_id']);
		$this->assertEquals($r[1]['org_id'], $params['org_id']);
		$this->assertEquals($r[2]['org_id'], $params['org_id']);
		$this->assertEquals($r[3]['org_id'], $params['org_id']);
		$this->assertEquals($r[4]['org_id'], $params['org_id']);
		
		// reviews by user
		$params= array();
		$params['user_id']= 1;
		$r= dRead::reviews($params);
		$this->assertEquals(count($r), 1);
		
		$this->assertEquals($r[0]['id'], 3);
		$this->assertEquals($r[0]['org_id'], 1);
		$this->assertEquals($r[0]['user_id'], $params['user_id']);
		$this->assertEquals($r[0]['title'], 'Good but needs improvement');
		$this->assertEquals($r[0]['rating'], 3);
		//$this->assertEquals($r[0]['created'], "2013-09-18 10:21:19");
		//$this->assertEquals($r[0]['modified'], "2013-09-18 10:21:21");
	}
	
	/** OTHER **/
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
	
  /** SESSION **/
	public function testlogin(){
		// True
		$user= 'dcruz@ymail.com';
		$pass= 'phourus';
		$result= dRead::login($user, $pass);
		//$this->assertTrue($result);
		
		// False
		$user= 'dcruz@gmail.com';
		$pass= 'phourus';
		$result= dRead::login($user, $pass);
		//$this->assertFalse($result);
	}
	
	public function testsession(){
		// ????
	}

  /** STATS **/
  public function testfollowers(){
    
  }
  
  public function testfollowing(){
    
  }
  
	public function teststats_posts(){

	}
	
	public function teststats_post(){

	}
	
	public function teststats_user(){
  	
	}

  public function teststats_org(){
    
  }	
  
	public function teststats_followers(){

	}
	
	public function teststats_totals(){

	}
	
	public function owner(){
  	
	}
	
}

?>