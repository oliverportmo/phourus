<?php

class qOther {

	# address
	public static function address($params){
	  $where= '';
	  if(isset($params['user_id'])){
  	  $where= sprintf("WHERE user_id = %d", $params['user_id']);
	  }else if(isset($params['org_id'])){
  	  $where= sprintf("WHERE org_id = %d", $params['org_id']);
	  }else if(isset($params['id'])){
  	  $where= sprintf("WHERE id = %d", $params['id']);
	  }else{
  	  return false;
	  }
		return sprintf("SELECT * FROM `%s` %s;", TABLE_ADDRESS, $where);
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