<?php

class oOrg
{	
	
	# GET
	public function get($params){  
	  if(isset($params['id'])){
  	  $q= qOrg::org($params);
  	  $org= dRead::single($q);
  	  return self::full($org);
	  }else{
	    $params['mode']= 'id';
	    $q= qOrg::org($params);
  	  $ids= dRead::collection($q);
  	  if(is_numeric($ids)){
    	  return $ids;
  	  }
  	  foreach($ids as $id){
    	  $out[]= self::get(array('id' => $id['id']));
  	  }
	  }
		return $out;	
	}
	
	# POST
	public function create($model){
		$out= dCreate::create($model, 'org');	
		return $out;
	}
	
	# PUT
	public function update($id, $model){
		$out= dUpdate::update($id, 'org', $model);
		return $out;
	}
	
	# DELETE
	public function delete($id){
		$out= dDelete::delete($id, 'org');
		return $out;
	}
	
	# FULL
	public function full($obj){
    if(is_numeric($obj)){
    	return $obj;
  	}
  	$out= array();
  	$out['org']= $obj;
  	$out['address']= oAddress::get(array('org_id' => $obj['id']));
	  $out['stats']= self::stats(array('org_id' => $obj['id']));
	  return $out;
	}
	
	# stats 
	public static function stats($params){
    $out= array();
	  $out['members']= 46;
	  $out['pending']= 12;
	  $out['avg_user']= 34;
	  
	  $out['comments']= 143;
	  $out['views']= 456;
	  $out['follows']= 64;
	  $out['thumbs']= 243;
	  
	  $out['posts']= 22;
	  $out['avg_post']= 32;
	  $out['influence']= 43;
	  
	  // stats_community: members, pending
	  // tposts, tcomments, tviews, tfollows
	  // average member influence & average post influence
	  // total posts
  	/*$q= uQueries::community(array('org_id' => $org_id));
  	
		$community= $result->r_single($q);
		foreach($community as $id){
  		$out[]= self::user_stats($id);
		}
		  	$q= qTotal::community($org_id);
  	$out= $result->r_single($q);
  	//$q= uQueries::total_pending($org_id);
  	//$out['pending']= $result->r_single($q);
		return $out;
		*/
		return $out;
	}
	
  # community
	public function community($params){
		$q= qOrg::community($params);
    $ids= dRead::collection($q);
		if(is_numeric($ids)){
  		return $ids;
		}
		foreach($ids as $i){	
			$out[]= oUser::get(array('id' => $i['id']));
		}
		return $out;
	}
}

?>