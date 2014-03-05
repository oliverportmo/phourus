<?php

class qOrg {
  
  # org
	public static function org($params){
		// state, zip, type, id, user_id
		$where= '';
		//if(isset($state)) { $filter= "AND ".TABLE_ADDRESS.".state = '$state'"; }
		//if(isset($zip)) { $filter= "AND ".TABLE_ADDRESS.".zip = '$zip'"; }
		if(isset($params['type'])) {	
		  // mapping?	
		  $type= $params['type'];
  		if($type== 'companies'){ $type= 'company'; }
  		if($type== 'govs'){ $type= 'gov'; }
  		if($type== 'groups'){ $type= 'group'; }
  		if($type== 'schools'){ $type= 'school'; }
  		
		  $where= sprintf("WHERE %s.type = '%s'", TABLE_ORGS, $type); 
		}
		if(isset($params['id'])) {
  		$where= sprintf("WHERE id = %d", $params['id']);
		}
		$fields = isset($params['mode']) && $params['mode']== 'id' ? 'id' : '*';
		return sprintf("SELECT %s FROM `%s` %s ORDER BY %s.influence DESC;", $fields, TABLE_ORGS, $where, TABLE_ORGS);
	}
	
	# stats
	public static function stats($org_id){

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

	# posts
	public static function posts($users, $types){
  	return sprintf("SELECT id FROM `%s` WHERE user_id IN (%s) AND types IN (%s);", TABLE_POSTS, $users, $types);
	}
	
	# states
	public static function states($type){
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
	
  # clout
	public static function clout($params){
	  $where= '';
	  if(isset($params['org_id'])){
  	  $where= sprintf("WHERE org_id = %d", $params['org_id']);
	  }else if(isset($params['id'])){
  	  $where= sprintf("WHERE id = %d", $params['id']);
	  }else{
  	  return false;
	  }
		return sprintf("SELECT * FROM `%s` %s;", TABLE_CLOUT, $where);
	}
	
	# reviews
	public static function reviews($params){
	  $where= '';
	  $limit= isset($params['limit']) ? $params['limit'] : 20;
	  $offset= isset($params['page']) ? ($params['page'] - 1) * $limit : 0; 
    $paging= sprintf("LIMIT %d, %d", $offset, $limit);
    
	  if(isset($params['org_id'])){
  	  $where= sprintf("WHERE org_id = %d", $params['org_id']);
	  }else if(isset($params['user_id'])){
  	  $where= sprintf("WHERE user_id = %d", $params['user_id']);
	  }else if(isset($params['id'])){
  	  $where= sprintf("WHERE id = %d", $params['id']);
	  }else{
  	  return false;
	  }
		return sprintf("SELECT * FROM `%s` %s %s;", TABLE_REVIEWS, $where, $paging);
	}
}

?>