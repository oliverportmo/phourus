<?php

class uQueries {

  /** POSTS **/
  # STREAM
	/*public static function posts($params){					
		$params= oPost::params($params);
		extract($params);
		if(!isset($author)){ $author= ''; }
		return "$mode $types $author $order $paging $users;";
	}*/
	
	# META
	public static function meta($params){		
		extract($params); 
		return "SELECT * FROM app_posts WHERE id = '$post_id';";
	}
	
	# POST
	public static function post($params){	
		extract($params); 
		return "SELECT * FROM $table WHERE post_id = '$post_id';";
	}
	
	# USERS
	public static function users($params){			
		$where= "";
		if(is_array($params)){
  		extract($params);
  		if(isset($id)){
    		$where= "WHERE id = '$id'";
  		}
		}else{
  		$where= "WHERE id = '$params'";
		}
		
		return "SELECT * FROM app_users $where;";	
	}
	
	# ORGS
	public static function orgs($params){
		// state, zip
		extract($params);
		$where= '';
		//if(isset($state)) { $filter= "AND app_address.state = '$state'"; }
		//if(isset($zip)) { $filter= "AND app_address.zip = '$zip'"; }
		if(isset($type)) {		
  		if($type== 'companies'){ $type= 'company'; }
  		if($type== 'govs'){ $type= 'gov'; }
  		if($type== 'groups'){ $type= 'group'; }
  		if($type== 'schools'){ $type= 'school'; }
		  $where= "WHERE app_orgs.type = '$type'"; 
		}
		if(isset($id)) {
  		$where= "WHERE id = '$id'";
		}
		if(isset($user_id)) {
  		$where= "WHERE user_id = '$user_id'";
		}
		if(isset($mode) && $mode== 'id'){
  		$fields= 'id';
		}else{
  		$fields= '*';
		}
		return "SELECT $fields FROM app_orgs $where ORDER BY app_orgs.influence DESC;";
	}
	
	/** CRUD **/
	# READ
	public static function get($id, $type){
    $table= uUtilities::table($type);
    return "SELECT * FROM $table WHERE id = '$id';";
	}
	
	# CREATE
	public static function create($model, $type){		
		$table= uUtilities::table($type);
		//unset($model['id']);
		//unset($model['created']);
		//unset($model['modified']);
		
		$pairs= uUtilities::pairs($model);
		extract($pairs);
		return "INSERT INTO $table ($keys) VALUES ($values);";
	}	

	# UPDATE
	public static function update($id, $type, $model){
		$table= uUtilities::table($type);
		unset($model['id']);
		unset($model['created']);
		$model['modified']= 'NOW()';
		
		$pairs= uUtilities::pairs($model, true);  
		return "UPDATE $table SET $pairs WHERE id = '$id';";		
	}
	
	public static function update_post($id, $type, $model){
		extract($model);
		$table= uUtilities::table($type);
		$pairs= uUtilities::pairs($model, true); 
		return "UPDATE $table SET $pairs WHERE post_id = '$id';";		
	}

	# DELETE
	public static function delete($id, $type){
		$table= uUtilities::table($type);
		return "DELETE FROM $table WHERE id = '$id';";
		//return "UPDATE app_posts SET privacy = '-1', modified = NOW() WHERE id = '$id';";		
	}	

	/** META **/
	# VIEWS
	public static function views($params){
		$where= '';
		extract($params);
		if(isset($viewer_id)){
  		$where= "WHERE viewer_id = '$viewer_id'";
		}
		if(isset($id)){
  		$where= "WHERE id = '$id'";
		}
		if(isset($post_id)){
  		$where= "WHERE post_id = '$post_id'";
		}
		if(isset($user_id)){
  		$where= "WHERE user_id = '$user_id'";
		}
		if(isset($org_id)){
  		$where= "WHERE org_id = '$org_id'";
		}
		
	  return "SELECT * FROM app_views $where;";
	}
	
	# THUMBS
	public static function thumbs($params){
	  $where= "";
	  extract($params);
	  if(isset($user_id)){
  	  $where= "WHERE user_id = '$user_id'";
	  }
	  if(isset($post_id)){
  	  $where= "WHERE post_id = '$post_id'";
	  }
	  if(isset($user_id) && isset($post_id)){
  	  $where= "WHERE user_id = '$user_id' AND post_id = '$post_id'";
	  }
	  if(isset($params['id'])){
  	  $where= "WHERE id = $id";
	  }
		return "SELECT * FROM app_thumbs $where;";
	}
		
	# COMMENTS
	public static function comments($params){
	  $where= '';
	  extract($params);
	  if(isset($post_id)){
  	  $where= "WHERE post_id = '$post_id'";
	  }
	  if(isset($user_id)){
  	  $where= "WHERE user_id = '$user_id'";
	  }
	  if(isset($id)){
  	  $where= "WHERE id = '$id'";
	  }
		return "SELECT * FROM app_comments $where;";
	}
	
	# FOLLOWS
	public static function follows($params){
	  $where= '';
	  extract($params);
	  if(isset($user_id)){
  	  $where= "WHERE user_id = '$user_id'";
	  }
	  if(isset($target_id)){
  	  $where= "WHERE target_id = '$target_id'";
	  }
	  if(isset($target_id) && isset($user_id)){
  	  $where= "WHERE target_id = '$target_id' AND user_id = '$user_id'";
	  }
	  if(isset($id)){
  	  $where= "WHERE id = '$id'";
	  }
		return "SELECT * FROM app_follows $where;";
	}
	
	
	/** ORGS **/
	# CLOUT
	public static function clout($params){
	  $where= '';
	  extract($params);
	  if(isset($org_id)){
  	  $where= "WHERE org_id = '$org_id'";
	  }
	  if(isset($id)){
  	  $where= "WHERE id = '$id'";
	  }
		return "SELECT * FROM app_clout $where";
	}
	
	# REVIEWS
	public static function reviews($params){
	  $where= '';
	  $paging= "";
	  extract($params);
	  if(isset($page) && isset($limit)){
  	  $start= ($page - 1) * $limit;
  	  $paging= "LIMIT $start, $limit";
	  }
	  if(isset($org_id)){
  	  $where= "WHERE org_id = '$org_id'";
	  }
	  if(isset($user_id)){
  	  $where= "WHERE user_id = '$user_id'";
	  }
	  if(isset($id)){
  	  $where= "WHERE id = '$id'";
	  }
		return "SELECT * FROM app_reviews $where;";
	}
	
	# ADDRESS
	public static function address($params){
	  extract($params);
	  $where= '';
	  if(isset($user_id)){
  	  $where= "WHERE user_id = '$user_id'";
	  }
	  if(isset($org_id)){
  	  $where= "WHERE org_id = '$org_id'";
	  }
	  if(isset($id)){
  	  $where= "WHERE id = '$id'";
	  }
		return "SELECT * FROM app_address $where;";
	}
	
	public static function tag($params){
	  extract($params);
	  $where= '';
	  if(isset($post_id)){
  	  $where= "WHERE post_id = '$post_id'";
	  }
	  if(isset($id)){
  	  $where= "WHERE id = '$id'";
	  }
		return "SELECT * FROM app_tags $where;";
	}
	
	public static function influence($params){
  	extract($params);
  	if(isset($post_id)){
    	return "SELECT influence FROM app_posts WHERE id = '$post_id';";
  	}
  	if(isset($user_id)){
    	return "SELECT influence FROM app_users WHERE id = '$user_id';";
  	}
  	if(isset($org_id)){
    	return "SELECT influence FROM app_orgs WHERE id = '$org_id';";
  	}
  	return false;
	}
	
	public function community($params){
  	$users= '';
  	$type= '';
  	extract($params);
  	if(isset($id))
    	$where= "WHERE id = $id";
  	if(isset($org_id)){
    	$where= "WHERE org_id = '$org_id'";
  	}
  	if(isset($id)){
    	$where= "WHERE user_id = '$user_id'";
  	}
  	$fields= 'id, type';
  	if(isset($mode) && $mode == 'id'){
    	$fields= 'id';
  	}
  	if(isset($mode) && $mode == 'full'){
    	$fields= "*";
    	$where= "WHERE app_members.org_id = '$org_id' AND app_members.user_id = app_users.id";
    	$users= ", app_users";
  	}
  	if(isset($types)){
    	$filter= "AND app_members.type IN('$types')";
  	}
  	return "SELECT $fields FROM app_members $users $where $filter;";
  	// SELECT COUNT(*) AS total FROM [comments/views/thumbs/ WHERE  
	}
	
  /** AUTH **/
	# LOGIN
	public static function login($params){			
		extract($params);
		return "SELECT id FROM app_users WHERE `$key` = '$username' AND `password` = '$password';";
	}
	
	# SESSION GET
	public static function session($params){		
		extract($params);
		return "SELECT * FROM app_tokens WHERE id = '$id' AND user_id = '$user_id';";
	}
	
	# SESSION AUTH
	public static function session_auth($params){
  	extract($params);
  	return "SELECT user_id FROM app_tokens WHERE id = '$id' AND user_id = '$user_id' AND expires >= NOW();";
	}
	
	# SESSION CREATE
	public static function session_create($params){	
		extract($params);
		return "INSERT INTO app_tokens (`id`, `expires`, `user_id`) VALUES ('$id', '$expires', '$user_id');";
	}	

  /** GENERIC **/
	# TOTAL
	public static function total($params){
		extract($params);
		$where= '';
		/*if($params['viewer_id']){
  		$where= "WHERE viewer_id = $viewer_id";
		}
		if($params['post_id'] && $params['type']){
  		$where= "WHERE post_id = $post_id AND type = '$type'";
		}
		if($params['user_id']){
  		$where= "WHERE user_id = $user_id";
		}
		if($params['org_id']){
  	  $where= "WHERE org_id = $org_id;";	
		}	*/
		return $where;	
		//$table= uUtilities::table->($type);
		//return "SELECT COUNT(*) AS total FROM $table $where;"; 
	}

	# UNIQUE
	public static function unique($params){
		extract($params);
		return "SELECT DISTINCT($field) FROM $table;";
	}
	
	/** STATS **/
	public static function stats_posts($user_id){
    return "SELECT type, COUNT(type) AS total FROM app_posts WHERE user_id = '$user_id' GROUP BY `type`;";
	}
	
	public static function stats_followers($user_id){
	 return "SELECT AVG(app_users.influence) AS average, COUNT(app_users.influence) AS total FROM app_users, app_follows WHERE app_follows.user_id = app_users.id AND app_follows.target_id = '$user_id';";
	}
	
	public static function stats_org($org_id){
  
  	
  	// user stats for each user
  	return "SELECT * FROM app_users WHERE id = '$org_id';";
	}
	
	public static function total_community($org_id){
  	return "SELECT type, COUNT(*) AS total FROM app_members WHERE org_id = '$org_id' GROUP BY type;";
	}
	
	public static function posts_org($users, $types){
  	return "SELECT id FROM app_posts WHERE user_id IN ($users) AND types IN ($types);";
	}
	
	
	/** TOTALS **/
	public static function total_comments($params){
	 extract($params);
	 if(isset($post_id)){
  	 $where= "WHERE app_posts.id = '$post_id' AND app_comments.post_id = app_posts.id";
	 }
	 if(isset($user_id)){
  	  $where= "WHERE app_posts.user_id = '$user_id' AND app_comments.post_id = app_posts.id";
	 }
	 return "SELECT COUNT(*) AS total FROM app_posts, app_comments $where;";	
	}
	
	public static function total_thumbs($params){
	 $where= "";
	 $stream= "";
	 extract($params);
	 //$exclude= "WHERE app_thumbs.user_id != app_posts.user_id";
	 if(isset($post_id)){
	   $where= "WHERE post_id = '$post_id'";
	 }
	 if(isset($user_id)){
  	 $where= "WHERE app_posts.user_id = '$user_id' AND app_thumbs.post_id = app_posts.id";
  	 $stream= 'app_posts,';
	 }
	 return "SELECT COUNT(*) AS total, SUM(positive) AS positive FROM $stream app_thumbs $where;";
	}
	
	public static function total_views($params){
	 extract($params);
	 $posts= '';
	 //$exclude= "AND app_views.user_id != app_posts.user_id";
	 if(isset($user_id)){
  	 $where= "WHERE app_posts.user_id = '$user_id' AND app_views.post_id = app_posts.id";
  	 $posts= 'app_posts,';
	 } 
	 if(isset($post_id)){
  	 $where= "WHERE app_views.post_id = '$post_id'";
	 }
	 return "SELECT COUNT(*) AS total FROM $posts app_views $where;";
	} 
	
	public static function total_posts($user_id){
	 return "SELECT COUNT(*) AS total FROM app_posts WHERE app_posts.user_id = '$user_id';";
	} 
	
	/** ORG STATES **/
	public static function org_states($type){
	  $short= array();
	  $short['govs']= 'gov';
	  $short['companies']= 'company';
	  $short['schools']= 'school';
	  $short['groups']= 'group';
	  if($short[$type]){
	   $type = $short[$type];
	  }
  	return "SELECT state, COUNT(state) as total FROM app_address, app_orgs WHERE app_address.org_id = app_orgs.id AND app_orgs.type = '$type' GROUP BY (state);";
	}
	
	/** PERMISSION **/
	public function owner($auth_id, $resource){
    $url= explode('/', $resource);

    $type= $url[2];
    $id= $url[3];
    
    $table= uUtilities::table($type);
    $resource_key= 'id';
    $user_key= 'user_id';
    
    return "SELECT * FROM $table WHERE $resource_key = '$id' AND $user_key = '$auth_id';";
	}
	
	public function schema($table){
    $table= uUtilities::table($table);
    return "SELECT column_name, column_type FROM information_schema.columns WHERE table_schema = 'phourus:dev' AND table_name = '$table';";
	}
	
	
}	

?>