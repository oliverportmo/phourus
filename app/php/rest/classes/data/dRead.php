<?php

class dRead {
	
	/** CORE **/
	public static function posts($params){
		$q= oPost::q($params);	
		$result= new uResult();
		$posts= $result->r_read($q);
		if(is_numeric($posts)){
  		return $posts;
		}
		foreach($posts as $i){	
			$out[]= oPost::get(array('id' => $i['id']));
		}
		return $out;
	}
	
	public static function total($params){
		$q= oPost::q($params);		
		$result= new uResult();
		$total= $result->r_single($q);
		$out= array();
		$out['total']= $total['COUNT(*)']; 
		return $out;
	}
	
	public static function meta($post_id){
		$params['post_id']= $post_id;
		$q= uQueries::post_meta($params);
		$result= new uResult();
		$out= $result->r_single($q);
		return $out;
	}
	
	public static function post($id, $type){
		$params['post_id']= $id;
		$params['table']= uUtilities::table($type);
		if($params['table']== false){
			return 400;	
		}
		$q= uQueries::post($params);
		$result= new uResult();
		$out= $result->r_single($q);
		return $out;
	}
	
	public static function user($params){
  	$q= uQueries::user($params);
  	$result= new uResult();
  	if(isset($params['id'])){
    	$out= $result->r_single($q);
  	}else{
    	$out= $result->r_read($q);
  	}
  	return $out;
	}		
	
	public static function org($params){
  	$q= uQueries::org($params);
  	$result= new uResult();
  	if(isset($params['id'])){
    	$out['org']= $result->r_single($q);
    	if(is_numeric($out['org'])){
      	return $out['org'];
    	}
    	$out['address']= dRead::address(array('org_id' => $params['id']));
  	  $out['stats']= oStats::stats(array('org_id' => $params['id']));
  	}else{
    	$out= $result->r_read($q);
  	}
  	return $out;
	}
			
	/** META **/
	public static function views($params){
  	$q= uQueries::views($params);
  	$result= new uResult();
  	if(isset($params['id'])){
    	$out= $result->r_single($q);
  	}else{
    	$out= $result->r_read($q);
  	}
  	return $out;
	}
	
	public static function thumbs($params){
  	$q= uQueries::thumbs($params);
  	$result= new uResult();
  	if(isset($params['id'])){
    	$out= $result->r_single($q);
  	}else{
    	$out= $result->r_read($q);
  	}
  	return $out;
	}
	
	public static function comments($params){
  	$q= uQueries::comments($params);
  	$result= new uResult();
  	if(isset($params['id'])){
    	$out= $result->r_single($q);
  	}else{
  	  $out= $result->r_read($q);
  	}
  	return $out;
	}
	
	public static function follows($params){
  	$q= uQueries::follows($params);
  	$result= new uResult();
  	if(isset($params['id'])){
    	$out= $result->r_single($q);
  	}else{
    	$out= $result->r_read($q);
  	}
  	return $out;
	}
		
	/** ORGS **/
	public static function clout($params){
  	$q= uQueries::clout($params);
  	$result= new uResult();
  	if(isset($params['id'])){
    	$out= $result->r_single($q);
  	}else{
    	$out= $result->r_read($q);
  	}
  	return $out;
	}
	
	public static function reviews($params){
  	$q= uQueries::reviews($params);
  	$result= new uResult();
  	if(isset($params['id'])){
    	$out= $result->r_single($q);
  	}else{
    	$out= $result->r_read($q);
  	}
  	return $out;
	}
	
	/** OTHER **/
	public static function address($params){
  	$q= uQueries::address($params);
  	$result= new uResult();
  	if(isset($params['id'])){
    	$out= $result->r_single($q);
  	}else{
    	$out= $result->r_read($q);
  	}
  	return $out;
	}
	
	public static function tag($params){
  	$q= uQueries::tag($params);
  	$result= new uResult();
  	if(isset($params['id'])){
    	$out= $result->r_single($q);
  	}else{
    	$out= $result->r_read($q);
  	}
  	return $out;
	}
	
	public static function influence($params){
    $q= uQueries::influence($params);
    $result= new uResult();
    $out= $result->r_single($q);
    return $out;	
	}
	
	public static function community($params){
  	$q= uQueries::community($params);
    $result= new uResult();
    $out= $result->r_read($q);
    return $out;	
	}
	
	/** SESSION **/
	public static function login($user, $key = 'email'){
		$params['username']= $user;
		$params['key']= $key;
		$q= uQueries::login($params);
		$result= new uResult();
		$out= $result->r_login($q);
		return $out;
	}
	
	public static function hash($user_id){
		$q= uQueries::hash($user_id);
		$result= new uResult();
		$out= $result->r_single($q);
		return $out;
	}
	
	public static function session($token, $user_id){
		$params= array();
		$params['id']= $token;
		$params['user_id']= $user_id;
		$q= uQueries::session($params);
		$result= new uResult();
		$out= $result->r_single($q);
		$out['user']= oUser::get(array('id' => $out['user_id']));
		return $out;
	}
	
  /** PERMISSION **/
	public static function owner($auth_id, $resource){
  	$q= uQueries::owner($auth_id, $resource);
  	$result= new uResult();
  	$out= $result->r_single($q);
  	return $out;
	}
	
	public static function followers($user_id){
    $q= uQueries::follows(array('target_id' => $user_id));
  	$result= new uResult();
  	$out= $result->r_read($q);
  	return $out;
  }
  
  public static function following($user_id){
    $q= uQueries::follows(array('user_id' => $user_id));
  	$result= new uResult();
  	$out= $result->r_read($q);  	
  	return $out;
  }
  
  public static function notifications($params){
    $q= uQueries::notifications($params);
  	$result= new uResult();
  	$out= $result->r_read($q);  	
  	return $out;    
  }
  
	/** STATS **/
  public static function post_stats($post_id){
  	$out= array();
    $result= new uResult();
    
    $q= uQueries::total_comments(array('post_id' => $post_id));
  	$comments= $result->r_single($q);
  	
  	$q= uQueries::total_thumbs(array('post_id' => $post_id));
  	$thumbs= $result->r_single($q);
  	
  	$q= uQueries::total_views(array('post_id' => $post_id));
  	$views= $result->r_single($q);
  	
  	$out['comments']= $comments['total'];
  	$out['thumbs']= $thumbs['total'];
  	$out['positive']= $thumbs['positive'];
  	$out['popularity']= 0;
  	if($thumbs['total'] > 1){
  	 $out['popularity']= (int) ($thumbs['positive']/$thumbs['total']*100);
  	}
  	$out['views']= $views['total']; 	
  	return $out;
	}
	
	public function user_stats($user_id){
  	$out= array();
  	$result= new uResult();
  	
		$q= uQueries::total_views(array('user_id' => $user_id));
		$views= $result->r_single($q);
		
		$q= uQueries::total_thumbs(array('user_id' => $user_id));
		$thumbs= $result->r_single($q);
		
		$q= uQueries::total_comments(array('user_id' => $user_id));	
		$comments= $result->r_single($q);
		
		$q= uQueries::post_stats($user_id);
		$totals= $result->r_single($q);
		
  	$q= uQueries::post_stats($user_id);
  	$posts= $result->r_read($q);
  	if(is_numeric($posts)){
    	$totals= $posts;
  	}else{
    	$totals= array();
    	foreach($posts as $post){
        $totals[$post['type']]= $post['total'];
    	} 
  	}	
  	
  	$q= uQueries::stats_followers($user_id);
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
	}
	
	public function org_stats($org_id){
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
		}*/
		return $out;
	}	
	
	public function stats_community($org_id){
  	$q= uQueries::total_community($org_id);
  	$out= $result->r_single($q);
  	$q= uQueries::total_pending($org_id);
  	$out['pending']= $result->r_single($q);
		return $out;
	}
	
	public static function stats_totals($user_id){
    $out= array();
    $result= new uResult();
    $params= array('user_id' => $user_id);
    $q= uQueries::total_comments($params);
  	$comments= $result->r_single($q);
  	
  	$q= uQueries::total_thumbs($params);
  	$thumbs= $result->r_single($q);
  	
  	$q= uQueries::total_views($params);
  	$views= $result->r_single($q);
  	
  	$q= uQueries::total_posts($user_id);
  	$posts= $result->r_single($q);
  	
  	$out['comments']= $comments['total'];
  	$out['thumbs']= $thumbs['total'];
  	$out['positive']= $thumbs['positive'];
  	$out['views']= $views['total'];
  	$out['posts']= $posts['total'];
  	
  	return $out;
	}
	
	/** SPECIAL **/
	public function special($params){
  	if(!is_array($params)){
      return 400;	
  	}
  	$result= new uResult();
  	extract($params);
  	switch($mode){
    	case 'states':
        $q= uQueries::org_states($params['type']);
        $out= $result->r_read($q);
    	break;
    	case 'recent':
    	
    	break;
    	default:
    	 return 404;
    	break;
  	}        
  	return $out;
	}
	
	/** SCHEMA **/
	public function schema($tables= ''){
		if($tables== ''){
  		$tables= self::default_schema();
		}
		foreach($tables as $table){
  		$q= uQueries::schema($table);
  		$result= new uResult();
  		$out[$table]= $result->r_read($q);
		}
		return $out;
	}
	
	private function default_schema(){
  	$out= array();
  	array_push($out, 'blogs');
  	array_push($out, 'ideas');
  	array_push($out, 'links');
  	array_push($out, 'events');
  	
  	array_push($out, 'checklist');
  	array_push($out, 'calculator');
  	array_push($out, 'matters');
  	
  	array_push($out, 'subjects');
  	array_push($out, 'questions');
  	array_push($out, 'answers');
  	
  	array_push($out, 'debates');
  	array_push($out, 'bills');
  	array_push($out, 'votes');
  	
  	array_push($out, 'beliefs');
  	array_push($out, 'timeline');
  	array_push($out, 'quotes');
  	return $out;
	}

}

?>