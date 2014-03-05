<?php

class oUser
{	
	
	# GET
	public function get($params){
		$q= qUser::user($params);
		if(isset($params['id'])){
  		$user= dRead::single($q);
  		return self::full($user);
		}else{	  
  		$users= dRead::collection($q);
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
	public function create($headers, $model){
	  $params= uUtilities::decode($headers['AUTHENTICATION']);
	  $model['email']= $params['username'];
		$model['hash'] = create_hash($params['password']);	
		$user= dCreate::user($model);
		if($user !== false){
  		return oSession::create($headers);
		}
		return false;
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
	
	# FULL
	public function full($obj){
	  if(is_numeric($obj)){
  		return $obj;
		}
		$out= array();
		$out['user']= $obj;
		$out['stats']= self::stats($obj['id']);
		$out['address']= oAddress::get(array('user_id' => $obj['id']));
		return $out;
	}
	
	# OTHER
	/** STATS **/
  public function stats($user_id){
    $out= array();
  	$result= new uResult();
  	
		$q= qTotal::views(array('user_id' => $user_id));
		$views= $result->r_single($q);
		
		$q= qTotal::thumbs(array('user_id' => $user_id));
		$thumbs= $result->r_single($q);
		
		$q= qTotal::comments(array('user_id' => $user_id));	
		$comments= $result->r_single($q);
		
		$q= qUser::posts($user_id);
		$totals= $result->r_single($q);
		
  	$q= qUser::posts($user_id);
  	$posts= $result->r_read($q);
  	if(is_numeric($posts)){
    	$totals= $posts;
  	}else{
    	$totals= array();
    	foreach($posts as $post){
        $totals[$post['type']]= $post['total'];
    	} 
  	}	
  	
  	$q= qTotal::favorites($user_id);
  	$followers= $result->r_single($q);
  	$followers['average']= (int) $followers['average'];
  	
		$out['views']= $views['total'];
		$out['thumbs']= $thumbs['total'];
		$out['positive']= $thumbs['positive'];
		$out['comments']= $comments['total'];
		$out['popularity']= 0;
  	if($thumbs['total'] > 1){
  	 $out['popularity']= $thumbs['positive']/$thumbs['total']*100;
  	}
		$out['posts']= $totals;
		$out['followers']= $followers;
		return $out;

    $out= array();
    $result= new uResult();
    $params= array('user_id' => $user_id);
    $q= qTotal::comments($params);
  	$comments= $result->r_single($q);
  	
  	$q= qTotal::thumbs($params);
  	$thumbs= $result->r_single($q);
  	
  	$q= qTotal::views($params);
  	$views= $result->r_single($q);
  	
  	$q= qTotal::posts($user_id);
  	$posts= $result->r_single($q);
  	
  	$out['comments']= $comments['total'];
  	$out['thumbs']= $thumbs['total'];
  	$out['positive']= $thumbs['positive'];
  	$out['views']= $views['total'];
  	$out['posts']= $posts['total'];
  	
  	return $out;
    
    $out= array();
    $out['posts']= dRead::post_stats($id);
    $out['followers']= dRead::stats_followers($id);
    $out['totals']= dRead::stats_totals($id);
    return $out;
	}
	
  # history
	public function history($params){
		$views= oView::views($params);
		if(is_numeric($views)){
  		return $views;
		}
		$out= array();
		foreach($views as $view){
		  if(!is_null($view['user_id'])){
  		  $out[]= oUser::get(array('id' => $view['user_id']));
		  }else if(!is_null($view['org_id'])){
  		  $out[]= oOrg::get(array('id' => $view['org_id']));
		  }else if(!is_null($view['post_id'])){
  		  $out[]= oPost::get(array('id' => $view['post_id']));
		  }
		}
		return $out;
	}
	
  # notifications
	public function notifications($params){
	  $q= qUser::notifications($params);  
		$notifications= dRead::collection($q);
		if(is_numeric($notifications)){
  		return $notifications;
		}
		$out= array();
		foreach($notifications as $n){
  		$e = $n;	  
		  $type= $n['type'];
		  if($type == 'comment' || $type == 'post' || $type == 'thumb'){
  		  $e['post']= oPost::get(array('id' => $n['target_id']));  
  		  $e['user']= oUser::get(array('id' => $n['user_id']));
		  }else if($type == 'member'){
  		  $e['org']= oOrg::get(array('id' => $n['user_id']));
		  }else if($type == 'favorite' || $type == 'view'){
  		  $e['user']= oUser::get(array('id' => $n['user_id']));
		  } 
		  $out[]= $e;
		}
		return $out;
	}
	
	/** RELATIONSHIPS **/
	public function relationships($id, $quotes = false){
  	$out= array();
  	$out['followers']= array();
  	$out['following']= array();
  	$out['friends']= array();
  	//followers: SELECT id FROM ".TABLE_FOLLOWS." WHERE target_id = $user_id
  	$followers= oFavorite::get(array('target_id' => $id));
  	if($followers== 404){
    	$followers= '';
  	}else{
    	foreach($followers as $follower){
    	 $out['followers'][]= $follower['user_id'];
    	}
  	}
  	
  	//following: SELECT id FROM ".TABLE_FAVORITES." WHERE user_id = $user_id
  	$following= oFavorite::get(array('user_id' => $id));
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
    	 unset($out['following'][array_search($value, $out['following'])]);
    	 unset($out['followers'][array_search($value, $out['followers'])]);
    	}
  	}
  	$out= self::commas($out, $quotes);
  	return $out;
	}
		
	/** COMMAS **/
	private function commas($data, $quotes = false){
	  $out= array();
	  foreach($data as $key => $value){
  	  $temp= ''; 
  	  foreach($value as $k => $v){
  	    if($quotes == true){
    	    $temp.= "'$v',";
  	    }else{
    	    $temp.= "$v,";
  	    }
  	  }  
  	  $trim= trim($temp, ",");
  	  $out[$key]= $trim;
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