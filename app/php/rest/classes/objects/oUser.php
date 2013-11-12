<?php

class oUser
{	
	
	# GET
	public function get($params){
		if(isset($params['id'])){
  		$out= array();
  		$out['user']= dRead::users($params);
  		if(is_numeric($out['user'])){
    		return $out['user'];
  		}
  		$out['stats']= oStats::stats(array('user_id' => $out['user']['id']));
  		$out['address']= oAddress::get(array('user_id' => $out['user']['id']));
		}else{	  
  		$users= dRead::users($params);
  		if(is_numeric($users)){
    		return $users;
  		}
      $out= array();
  		foreach($users as $user){
  		  $out[]= oUser::get(array('id' => $user['id']));
  		}
		}
		return $out;
	}
		
	# POST
	public function create($model){
		$out= dCreate::create($model, 'users');	
		return $out;
	}
	
	# PUT
	public function update($id, $model){
  	$out= dUpdate::update($id, 'user', $model);
		return $out;
	}
	
	# DELETE
	public function delete($id){
		$out= dDelete::delete($id, 'user');
		return $out;
	}	
	
	# OTHER
	/** STATS **/
  public function stats($id){
    $out= array();
    $out['posts']= dRead::stats_posts($id);
    $out['followers']= dRead::stats_followers($id);
    $out['totals']= dRead::stats_totals($id);
    return $out;
	}
	
	/** RELATIONSHIPS **/
	public function relationships($id){
  	$out= array();
  	$out['followers']= array();
  	$out['following']= array();
  	$out['friends']= array();
  	//followers: SELECT id FROM follow WHERE target_id = $user_id
  	$followers= dRead::followers($id);
  	if($followers== 404){
    	$followers= '';
  	}else{
    	foreach($followers as $follower){
    	 $out['followers'][]= $follower['user_id'];
    	}
  	}
  	
  	//following: SELECT id FROM app_follows WHERE user_id = $user_id
  	$following= dRead::following($id);
  	if($following== 404){
    	$following= '';
  	}else{
    	foreach($following as $followee){
    	 $out['following'][]= $followee['target_id'];
    	}
    }
  	//zip followers & following
  	$friends= array_intersect($out['followers'], $out['following']);
  	if($friends== 404){
    	$friends= '';
  	}else{
    	foreach($friends as $key => $value){
    	 $out['friends'][]= $value;
    	}
  	}
  	$out= self::commas($out);
  	return $out;
	}
	
	/** COMMAS **/
	private function commas($data){
	  $out= array();
	  foreach($data as $key => $value){
  	  $temp= ''; 
  	  foreach($value as $k => $v){
  	   $temp.= $v.",";
  	  }
  	  $out[$key]= trim($temp, ",");
	  }
  	return $out;
	}
	
	/** RECENT **/
	public function recent($id){
  	$out= array();
    $out[]= array('id' => '1', 'post_id' => '1', 'title' => 'Increase school budget: $1.2 Million', 'type' => 'debates');
    $out[]= array('id' => '2', 'post_id' => '1', 'title' => 'Educational shortfall: USA', 'type' => 'blogs');
    $out[]= array('id' => '3', 'post_id' => '1', 'title' => 'Increase US revenues', 'type' => 'ideas');
    $out[]= array('id' => '4', 'post_id' => '1', 'title' => 'American History 101', 'type' => 'subjects');
    return $out;
	}
}

?>