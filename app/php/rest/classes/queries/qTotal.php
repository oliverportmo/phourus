<?php

class qTotal {
  
  # posts
	public static function posts($user_id){
	 return sprintf("SELECT COUNT(*) AS total FROM `%s` WHERE user_id = %d;", TABLE_POSTS, $user_id);
	} 
	
	# views
	public static function views($params){
	 $where= '';
	 //$exclude= "AND ".TABLE_VIEWS.".user_id != .user_id";
	 if(isset($params['user_id'])){
  	 $where= sprintf("WHERE %s.id = %s.post_id AND %s.user_id = %d", TABLE_POSTS, TABLE_VIEWS, TABLE_POSTS, $params['user_id']);
  	 $fields= sprintf("`%s`, `%s`", TABLE_POSTS, TABLE_VIEWS);
	 }else if(isset($params['post_id'])){
  	 $where= sprintf("WHERE %s.post_id = %d", TABLE_VIEWS, $params['post_id']);
  	 $fields= sprintf("`%s`", TABLE_VIEWS);
	 }else{
  	 return false;
	 }
	 return sprintf("SELECT COUNT(*) AS total FROM %s %s;", $fields, $where);
	} 
	
	# thumbs
	public static function thumbs($params){
	 $where= "";
	 $posts= "";
	 //$exclude= "WHERE ".TABLE_THUMBS.".user_id != .user_id";
	 if(isset($params['post_id'])){
	   $where= sprintf("WHERE post_id = %d", $params['post_id']);
	   $fields= sprintf("`%s`", TABLE_THUMBS);
	 }else if(isset($params['user_id'])){
  	 $where= sprintf("WHERE %s.id = %s.post_id AND %s.user_id = %d", TABLE_POSTS, TABLE_THUMBS, TABLE_POSTS, $params['user_id']);
  	 $fields= sprintf("`%s`, `%s`", TABLE_POSTS, TABLE_THUMBS);
	 }else{
  	 return false;
	 }
	 return sprintf("SELECT COUNT(*) AS total, SUM(positive) AS positive FROM %s %s;", $fields, $where);
	}
	
  # comments
	public static function comments($params){
	 if(isset($params['post_id'])){
  	 $where= sprintf("AND %s.id = %d", TABLE_POSTS, $params['post_id']);
	 }else if(isset($params['user_id'])){
  	  $where= sprintf("AND %s.user_id = %d", TABLE_POSTS, $params['user_id']);
	 }else{
  	 return false;
	 }
	 return sprintf("SELECT COUNT(*) AS total FROM `%s`, `%s` WHERE %s.id = %s.post_id %s;", TABLE_POSTS, TABLE_COMMENTS, TABLE_POSTS, TABLE_COMMENTS, $where);	
	}
	
	# favorites
	public static function favorites($user_id){
	 return sprintf("SELECT AVG(%s.influence) AS average, COUNT(%s.influence) AS total FROM `%s`, `%s` WHERE %s.id = %s.user_id AND %s.target_id = %d;", TABLE_USERS, TABLE_USERS, TABLE_USERS, TABLE_FAVORITES, TABLE_USERS, TABLE_FAVORITES, TABLE_FAVORITES, $user_id);
	}
	
	# community
	public static function community($org_id){
  	return sprintf("SELECT type, COUNT(*) AS total FROM `%s` WHERE org_id = %d GROUP BY type;", TABLE_MEMBERS, $org_id);
	}
	
}

?>