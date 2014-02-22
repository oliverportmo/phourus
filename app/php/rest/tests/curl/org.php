<?php

require '../curl.php';

class orgtest extends PHPUnit_Framework_TestCase
{
  # GET
	public function testorg_get(){
  	// Valid
		$org_id= '1';
		$r= curl("org/?id=$org_id");

		$org= $r['org'];
		$this->assertEquals($org_id, $org['id']);
		$this->assertEquals(1, $org['user_id']);
		$this->assertEquals('gov', $org['type']);
		$this->assertEquals('Town of Gorham, ME', $org['name']);
		$this->assertEquals(41, $org['influence']);
		$this->assertEquals('(542)422-1234', $org['phone']);
		$this->assertEquals('(542)422-1432', $org['fax']);
		$this->assertEquals('info@gorhamme.gov', $org['email']);
		
		$this->assertEquals(1, count($r['address']));
		
		// Invalid
		$org_id= 'I-DONT-EXIST';
		$r= curl("org/?id=$org_id");
		$this->assertEquals(404, $r);
	}

	# POST
	public function testorg_post(){
    $model= array();
    $model['user_id']= 1;
    $model['type']= 'company';
    $model['name']= 'Phourus LLC';
    $model['shortname']= 'phourus';  
    $model['email']= 'info@jessedrelick.com';
    $model['phone']= '6037831358';
    $model['fax']= '6037831358';
    $model['about']= '6037831358';
    $model['contact']= 44;
    $model['video']= '6037831358';
    $model['channel']= '6037831358';
    $model['influence']= 48;
    
    # PROCESS
    $r= curl("org/", array('post' => $model));
    $c= oOrg::get(array('id' => $r));
    
    # OBJECTS
    $org= $c['org'];
    $stats= $c['stats'];
    $address= $c['address'];
    
    # ID
    $this->assertEquals($org['id'], $r);
    $this->assertEquals($model['user_id'], $org['user_id']);
    
    # DATES
    //$this->assertEquals(uUtilities::now(), $org['created']);
    //$this->assertEquals('0000-00-00 00:00:00', $org['modified']);
    
    # ORG
    $this->assertEquals($model['type'], $org['type']);
    $this->assertEquals($model['name'], $org['name']);
    $this->assertEquals($model['shortname'], $org['shortname']);
    $this->assertEquals($model['email'], $org['email']);
    $this->assertEquals($model['phone'], $org['phone']);
    $this->assertEquals($model['fax'], $org['fax']);
    $this->assertEquals($model['about'], $org['about']);
    $this->assertEquals($model['contact'], $org['contact']);
    $this->assertEquals($model['video'], $org['video']);
    $this->assertEquals($model['channel'], $org['channel']);
    $this->assertEquals($model['influence'], $org['influence']);

    # STATS
    
    # ADDRESS
    
    # RETURN
    $model['id']= $r;
    return $model;
  }
  
  # PUT
  /**
   * @depends testorg_post
   */
  public function testorg_put($input){
    $update= array();
    $update['email']= 'info@phourus.com'; 
    
    $options= array();
		$options['put']= $update;
		
		# PROCESS
		$r= curl("org/".$input['id'], $options);

		# OBJECTS
		$id= $r['id'];
		$model= $r['model'];
		$original= $r['original'];
		$current= $r['current'];
		
		$this->assertEquals($update['email'], $current['email']);
  }
  
  # DELETE
  /**
   * @depends testorg_post
   */ 
  public function testorg_delete($model){
    $options= array();
    $options['delete']= true;
    
    $r= curl("org/".$model['id'], $options);
    $this->assertTrue($r);
    
    $d= oOrg::get(array('id' => $model['id']));
    $this->assertEquals(404, $d);
  }
}

?>