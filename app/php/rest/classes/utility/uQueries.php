<?php

class uQueries {

	/** CRUD **/
	# get
	public static function get($id, $type){
    $table= uUtilities::table($type);
    return sprintf("SELECT * FROM $table WHERE id = %d;", $table, $id);
	}
	
	# create
	public static function create($model, $type){		
		$table= uUtilities::table($type);		
		$pairs= uUtilities::pairs($model);
		return sprintf("INSERT INTO `%s` (%s) VALUES (%s);", $table, $pairs['keys'], $pairs['values']);
	}	

	# update
	public static function update($id, $type, $model){
		$table= uUtilities::table($type);
		unset($model['id']);
		unset($model['created']);
		$model['modified']= 'NOW()';
		
		$pairs= uUtilities::pairs($model, true);  
		return sprintf("UPDATE `%s` SET %s WHERE id = %d;", $table, $pairs, $id);		
	}
	
	# delete
	public static function delete($id, $type){
		$table= uUtilities::table($type);
		return sprintf("DELETE FROM `%s` WHERE id = %d;", $table, $id);
		//return "UPDATE  SET privacy = '-1', modified = NOW() WHERE id = '$id';";		
	}
		
	/** POST **/
	public static function post($params){		 
		return sprintf("SELECT * FROM `%s` WHERE id = %d;", TABLE_POSTS, $params['post_id']);
	}
	
	# meta
	public static function post_meta($params){	
		return sprintf("SELECT * FROM `%s` WHERE post_id = %d;", $params['table'], $params['post_id']);
	}
	
	# stats
	public static function post_stats($user_id){
    return sprintf("SELECT type, COUNT(type) AS total FROM %s WHERE user_id = %d GROUP BY `type`;", TABLE_POSTS, $user_id);
	}
	
	# update
	public static function post_update($id, $type, $model){
		$table= uUtilities::table($type);
		$pairs= uUtilities::pairs($model, true); 
		return sprintf("UPDATE `%s` SET %s WHERE post_id = %d;", $table, $pairs, $id);		
	}
	
	/** USER **/
	public static function user($params){			
		$user_id= 0;
		if(is_array($params)){
  		if(isset($params['id'])){
    		$user_id= $params['id'];
  		}
		}else{
  		$user_id= $params;
		}
		return sprintf("SELECT * FROM `%s` WHERE id = %s;", TABLE_USERS, $user_id);	
	}
	
	# ORGS
	public static function org($params){
		// state, zip, type, id, user_id
		$where= '';
		//if(isset($state)) { $filter= "AND ".TABLE_ADDRESS.".state = '$state'"; }
		//if(isset($zip)) { $filter= "AND ".TABLE_ADDRESS.".zip = '$zip'"; }
		if(isset($params['type'])) {	
		  // mapping?	
  		if($type== 'companies'){ $type= 'company'; }
  		if($type== 'govs'){ $type= 'gov'; }
  		if($type== 'groups'){ $type= 'group'; }
  		if($type== 'schools'){ $type= 'school'; }
  		
		  $where= sprintf("WHERE %s.type = '%s'", TABLE_ORGS, $type); 
		}
		if(isset($id)) {
  		$where= sprintf("WHERE id = %d", $id);
		}
		$fields = isset($mode) && $mode== 'id' ? 'id' : '*';
		return sprintf("SELECT %s FROM `%s` %s ORDER BY %s.influence DESC;", $fields, TABLE_ORGS, $where, TABLE_ORGS);
	}
	
	public static function org_stats($org_id){

	}

	public static function org_posts($users, $types){
  	return sprintf("SELECT id FROM `%s` WHERE user_id IN (%s) AND types IN (%s);", TABLE_POSTS, $users, $types);
	}
	
	public static function org_states($type){
	  $short= array();
	  $short['govs']= 'gov';
	  $short['companies']= 'company';
	  $short['schools']= 'school';
	  $short['groups']= 'group';
	  if($short[$type]){
	   $type = $short[$type];
	  }
  	return sprintf("SELECT state, COUNT(state) AS total FROM `%s`, `%s` WHERE %s.org_id = %s.id AND %s.type = '%s' GROUP BY (state);", TABLE_ADDRESS, TABLE_ORGS, TABLE_ADDRESS, TABLE_ORGS, TABLE_ORGS, $type);
	}
	
	/** SOCIAL **/
	# views
	public static function views($params){
		$where= '';
		if(isset($params['viewer_id'])){
  		$where= sprintf("WHERE viewer_id = %d", $params['viewer_id']);
		}
		if(isset($params['id'])){
  		$where= sprintf("WHERE id = %d", $params['id']);
		}
		if(isset($params['post_id'])){
  		$where= sprintf("WHERE post_id = %d", $params['post_id']);
		}
		if(isset($params['user_id'])){
  		$where= sprintf("WHERE user_id = %d", $params['user_id']);
		}
		if(isset($params['org_id'])){
  		$where= sprintf("WHERE org_id = %d", $params['org_id']);
		}
		if(!isset($params['limit'])){
  		$params['limit'] = 20;
		} 
		if(isset($params['page'])){
  		$offset = $params['page'] * $params['limit']; 
		}else{
  		$offset = 0;
		}
		$paging = sprintf("LIMIT %d, %d", $offset, $params['limit']);
		
	  return sprintf("SELECT * FROM ".TABLE_VIEWS." $where $paging;", TABLE_VIEWS, $where, $paging);
	}
	
	# thumbs
	public static function thumbs($params){
	  $where= "";
	  if(isset($params['user_id'])){
  	  $where= sprintf("WHERE user_id = %d", $params['user_id']);
	  }
	  if(isset($params['post_id'])){
  	  $where= sprintf("WHERE post_id = %d", $params['post_id']);
	  }
	  if(isset($params['user_id']) && isset($params['post_id'])){
  	  $where= sprintf("WHERE user_id = %d AND post_id = %d", $params['user_id'], $params['post_id']);
	  }
	  if(isset($params['id'])){
  	  $where= sprintf("WHERE id = %d", $params['id']);
	  }
		return sprintf("SELECT * FROM `%s` %s;", TABLE_THUMBS, $where);
	}
		
	# comments
	public static function comments($params){
	  $where= '';
	  if(isset($params['post_id'])){
  	  $where= sprintf("WHERE post_id = %d", $params['post_id']);
	  }
	  if(isset($params['user_id'])){
  	  $where= sprintf("WHERE user_id = %d", $params['user_id']);
	  }
	  if(isset($params['id'])){
  	  $where= sprintf("WHERE id = %d", $params['id']);
	  }
		return sprintf("SELECT * FROM `%s` %s;", TABLE_COMMENTS, $where);
	}
	
	# follows
	public static function follows($params){
	  $where= '';
	  if(isset($params['user_id'])){
  	  $where= sprintf("WHERE user_id = %d", $params['user_id']);
	  }
	  if(isset($params['target_id'])){
  	  $where= sprintf("WHERE target_id = %d", $params['target_id']);
	  }
	  if(isset($params['target_id']) && isset($params['user_id'])){
  	  $where= sprintf("WHERE target_id = %d AND user_id = %d", $params['target_id'], $params['user_id']);
	  }
	  if(isset($params['id'])){
  	  $where= sprintf("WHERE id = %d", $params['id']);
	  }
		return sprintf("SELECT * FROM `%s` %s;", TABLE_FAVORITES, $where);
	}
	
	/** INFO **/
	# clout
	public static function clout($params){
	  $where= '';
	  if(isset($params['org_id'])){
  	  $where= sprintf("WHERE org_id = %d", $params['org_id']);
	  }
	  if(isset($params['id'])){
  	  $where= sprintf("WHERE id = %d", $params['id']);
	  }
		return sprintf("SELECT * FROM `%s` %s", TABLE_CLOUT, $where);
	}
	
	# reviews
	public static function reviews($params){
	  $where= '';
	  $paging= "";
	  if(isset($params['page']) && isset($params['limit'])){
  	  $start= ($params['page'] - 1) * $params['limit'];
  	  $paging= sprintf("LIMIT %d, %d", $start, $params['limit']);
	  }
	  if(isset($params['org_id'])){
  	  $where= sprintf("WHERE org_id = %d", $params['org_id']);
	  }
	  if(isset($params['user_id'])){
  	  $where= sprintf("WHERE user_id = %d", $params['user_id']);
	  }
	  if(isset($params['id'])){
  	  $where= sprintf("WHERE id = %d", $params['id']);
	  }
		return sprintf("SELECT * FROM `%s` %s;", TABLE_REVIEWS, $where);
	}
	
	/** OTHER **/
	# address
	public static function address($params){
	  $where= '';
	  if(isset($params['user_id'])){
  	  $where= sprintf("WHERE user_id = %d", $params['user_id']);
	  }
	  if(isset($params['org_id'])){
  	  $where= sprintf("WHERE org_id = %d", $params['org_id']);
	  }
	  if(isset($params['id'])){
  	  $where= sprintf("WHERE id = %d", $params['id']);
	  }
		return sprintf("SELECT * FROM `%s` %s;", TABLE_ADDRESS, $where);
	}
	
	# tag
	public static function tag($params){
	  $where= '';
	  if(isset($params['post_id'])){
  	  $where= sprintf("WHERE post_id = %d", $params['post_id']);
	  }
	  if(isset($params['id'])){
  	  $where= sprintf("WHERE id = %d", $params['id']);
	  }
		return sprintf("SELECT * FROM `%` %s;", TABLE_TAGS, $where);
	}
	
	# influence
	public static function influence($params){
  	if(isset($params['post_id'])){
    	return sprintf("SELECT influence FROM `%s` WHERE id = %d;", TABLE_POSTS, $params['post_id']);
  	}
  	if(isset($params['user_id'])){
    	return sprintf("SELECT influence FROM `%s` WHERE id = %d;", TABLE_USERS, $params['user_id']);
  	}
  	if(isset($params['org_id'])){
    	return sprintf("SELECT influence FROM `%s` WHERE id = %d;", TABLE_ORGS, $params['org_id']);
  	}
  	return false;
	}
	
	# community
	public function community($params){
  	$users= '';
  	$type= '';
  	if(isset($params['id']))
    	$where= sprintf("WHERE id = %d", $params['id']);
  	if(isset($params['org_id'])){
    	$where= sprintf("WHERE org_id = %d", $params['org_id']);
  	}
  	if(isset($params['user_id'])){
    	$where= sprintf("WHERE user_id = %d", $params['user_id']);
  	}
  	$fields= 'id, type';
  	if(isset($params['mode']) && $params['mode'] == 'id'){
    	$fields= 'id';
  	}
  	if(isset($params['mode']) && $params['mode'] == 'full'){
    	$fields= "*";
    	$where= sprintf("WHERE %s.org_id = %d AND %s.user_id = %s.id", TABLE_MEMBERS, $params['org_id'], TABLE_MEMBERS, TABLE_USERS);
    	$users= sprintf(", `%s`", TABLE_USERS);
  	}
  	if(isset($params['types'])){
    	$filter= sprintf("AND %s.type IN(%s)", TABLE_MEMBERS, $params['types']);
  	}
  	return sprintf("SELECT %s FROM `%s` %s %s %s;", $fields, TABLE_MEMBERS, $users, $where, $filter);
  	// SELECT COUNT(*) AS total FROM [comments/views/thumbs/ WHERE  
	}
	
	# notifications
	public function notifications($params){
    $user_id = $params['user_id'];
    isset($params['limit']) ? $limit = $params['limit'] : $limit = 20;
    isset($params['page']) ? $page = $params['page'] : $page = 0;
    $offset = $page * $limit;
    $favorites = '1,3,4';
    
    $query = sprintf("SELECT user_id, target_id, created, type FROM (");
    
    /** POSTS **/
    // thumbs
    $fields = sprintf("%s.user_id AS user_id, %s.id AS target_id, %s.created AS created, 'thumb' AS type", TABLE_THUMBS, TABLE_POSTS, TABLE_THUMBS);
    $query.= sprintf("SELECT $fields FROM `%s` INNER JOIN `%s` ON %s.id = %s.post_id WHERE %s.user_id = %d UNION ", $fields, TABLE_POSTS, TABLE_THUMBS, TABLE_POSTS, TABLE_THUMBS, TABLE_POSTS, $user_id);   

    // comments
    $fields = sprintf("%s.user_id AS user_id, %s.id AS target_id, %s.created AS created, 'comment' AS type", TABLE_COMMENTS, TABLE_POSTS, TABLE_COMMENTS);
    $query.= sprintf("SELECT $fields FROM `%s` INNER JOIN `%s` ON %s.id = %s.post_id WHERE %s.user_id = %d UNION ", $fields, TABLE_POSTS, TABLE_COMMENTS, TABLE_POSTS, TABLE_COMMENTS, TABLE_POSTS, $user_id);
      
    // posts
    $fields = sprintf("%s.user_id AS user_id, %s.id AS target_id, %s.created AS created, 'post' AS type", TABLE_POSTS, TABLE_POSTS, TABLE_POSTS);
    $query.= sprintf("SELECT %s FROM `%s` WHERE %s.user_id IN(%s) UNION ", $fields, TABLE_POSTS, TABLE_POSTS, $favorites);

    /** USERS **/
    // favorites
    $fields = sprintf("%s.user_id AS user_id, %s.target_id AS target_id, %s.created AS created, 'favorite' AS type", TABLE_FAVORITES, TABLE_FAVORITES, TABLE_FAVORITES);
    $query.= sprintf("SELECT %s FROM `%s` WHERE %s.target_id = %d UNION ", $fields, TABLE_FAVORITES, TABLE_FAVORITES, $user_id);
    
    // profile views
    $fields = sprintf("%s.user_id AS user_id, %s.user_id AS target_id, %s.created AS created, 'view' AS type", TABLE_VIEWS, TABLE_VIEWS, TABLE_VIEWS);
    $query.= sprintf("SELECT %s FROM `%s` WHERE %s.user_id = %d", $fields, TABLE_VIEWS, TABLE_VIEWS, $user_id);

    /** ORGS **/
    // accept
    
    
    $query.= sprintf(") AS x ORDER BY created DESC LIMIT %d, %d;", $offset, $limit);
    return $query;
	}
	
  /** AUTH **/
	# login
	public static function login($params){			
  	// @key not good!
		return sprintf("SELECT id FROM %s WHERE %s = '%s';", TABLE_USERS, $params['key'], $params['username']);
	}
	
	# hash
	public static function hash($user_id){			
		return sprintf("SELECT hash FROM %s WHERE user_id = %d;", TABLE_PASSWORDS, $user_id);
	}
	
	# session get
	public static function session($params){		
		return sprintf("SELECT * FROM `%s` WHERE id = %d AND user_id = %d;", TABLE_TOKENS, $params['id'], $params['user_id']);
	}
	
	# session auth
	public static function session_auth($params){
  	return sprintf("SELECT user_id FROM `%s` WHERE id = %d AND user_id = %d AND expires >= NOW();", TABLE_TOKENS, $params['id'], $params['user_id']);
	}
	
	# session create
	public static function session_create($params){	
		return sprintf("INSERT INTO %s (`id`, `expires`, `user_id`) VALUES (%d, '%s', %d);", TABLE_TOKENS, $params['id'], $params['expires'], $params['user_id']);
	}	
	
	/** STATS **/
	public static function stats_followers($user_id){
	 return sprintf("SELECT AVG(%s.influence) AS average, COUNT(%s.influence) AS total FROM `%s`, `%s` WHERE %s.user_id = %s.id AND %s.target_id = %d;", TABLE_USERS, TABLE_USERS, TABLE_USERS, TABLE_FAVORITES, TABLE_FAVORITES, TABLE_USERS, TABLE_FAVORITES, $params['user_id']);
	}
	
	/** TOTALS **/
	# comments
	public static function total_comments($params){
	 if(isset($params['post_id'])){
  	 $where= sprintf("WHERE %s.id = %d AND %s.post_id = %s.id", TABLE_POSTS, $params['post_id'], TABLE_COMMENTS, TABLE_POSTS);
	 }
	 if(isset($params['user_id'])){
  	  $where= sprintf("WHERE %s.user_id = %d AND %s.post_id = %s.id", TABLE_POSTS, $params['user_id'], TABLE_COMMENTS, TABLE_POSTS);
	 }
	 return sprintf("SELECT COUNT(*) AS total FROM %s, %s %s;", TABLE_POSTS, TABLE_COMMENTS, $where);	
	}
	
	# thumbs
	public static function total_thumbs($params){
	 $where= "";
	 $posts= "";
	 //$exclude= "WHERE ".TABLE_THUMBS.".user_id != .user_id";
	 if(isset($params['post_id'])){
	   $where= sprintf("WHERE post_id = %d", $params['post_id']);
	 }
	 if(isset($params['user_id'])){
  	 $where= sprintf("WHERE %s.user_id = %d AND %s.post_id = %s.id", TABLE_POSTS, $params['user_id'], TABLE_THUMBS, TABLE_POSTS);
  	 $posts= sprintf("`%s`,", TABLE_POSTS);
	 }
	 return sprintf("SELECT COUNT(*) AS total, SUM(positive) AS positive FROM %s %s %s;", $posts, TABLE_THUMBS, $where);
	}
	
	# views
	public static function total_views($params){
	 $posts= '';
	 //$exclude= "AND ".TABLE_VIEWS.".user_id != .user_id";
	 if(isset($params['user_id'])){
  	 $where= sprintf("WHERE %s.user_id = %d AND %s.post_id = %s.id", TABLE_POSTS, $params['user_id'], TABLE_VIEWS, TABLE_POSTS);
  	 $posts= sprintf("`%s`,", TABLE_POSTS);
	 } 
	 if(isset($params['post_id'])){
  	 $where= sprintf("WHERE %s.post_id = %d", TABLE_VIEWS, $params['post_id']);
	 }
	 return sprintf("SELECT COUNT(*) AS total FROM %s %s %s;", $posts, TABLE_VIEWS, $where);
	} 
	
	# posts
	public static function total_posts($user_id){
	 return sprintf("SELECT COUNT(*) AS total FROM `%s` WHERE %s.user_id = %d;", TABLE_POSTS, TABLE_POSTS, $user_id);
	} 
	
	# community
	public static function total_community($org_id){
  	return sprintf("SELECT type, COUNT(*) AS total FROM `%s` WHERE org_id = %d GROUP BY type;", TABLE_MEMBERS, $org_id);
	}
		
	/** PERMISSION **/
	public function owner($auth_id, $resource){
    $url= explode('/', $resource);

    $type= $url[2];
    $id= $url[3];
    
    $table= uUtilities::table($type);
    $resource_key= 'id';
    $user_key= 'user_id';
    
    return sprintf("SELECT * FROM `%s` WHERE %s = %d AND %s = %d;", $table, $resource_key, $id, $user_key, $auth_id);
	}
	
	/** SCHEMA **/
	public function schema($table){
    $table= uUtilities::table($table);
    return sprintf("SELECT column_name, column_type FROM information_schema.columns WHERE table_schema = 'phourus:dev' AND table_name = '%s';", $table);
	}
}	

?>