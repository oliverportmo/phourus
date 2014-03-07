<?php

class qUser {
  
  # user
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
	
  # posts
	public static function posts($user_id){
    return sprintf("SELECT type, COUNT(type) AS total FROM %s WHERE user_id = %d GROUP BY `type`;", TABLE_POSTS, $user_id);
	}
	
  # notifications
	public static function notifications($params){
    $user_id = $params['user_id'];
    isset($params['limit']) ? $limit = $params['limit'] : $limit = 20;
    isset($params['page']) ? $page = $params['page'] : $page = 0;
    $offset = $page * $limit;
    $favorites = '1,3,4';
    
    $query = sprintf("SELECT user_id, target_id, created, type FROM (");
    
    /** POSTS **/
    // thumbs
    $fields = sprintf("%s.user_id AS user_id, %s.id AS target_id, %s.created AS created, 'thumb' AS type", TABLE_THUMBS, TABLE_POSTS, TABLE_THUMBS);
    $query.= sprintf("SELECT %s FROM `%s` INNER JOIN `%s` ON %s.id = %s.post_id WHERE %s.user_id = %d UNION ", $fields, TABLE_POSTS, TABLE_THUMBS, TABLE_POSTS, TABLE_THUMBS, TABLE_POSTS, $user_id);   

    // comments
    $fields = sprintf("%s.user_id AS user_id, %s.id AS target_id, %s.created AS created, 'comment' AS type", TABLE_COMMENTS, TABLE_POSTS, TABLE_COMMENTS);
    $query.= sprintf("SELECT %s FROM `%s` INNER JOIN `%s` ON %s.id = %s.post_id WHERE %s.user_id = %d UNION ", $fields, TABLE_POSTS, TABLE_COMMENTS, TABLE_POSTS, TABLE_COMMENTS, TABLE_POSTS, $user_id);
      
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
	
	# delete
	public static function delete_tokens($id){
  	return sprintf("DELETE FROM `%s` WHERE user_id = %d;", TABLE_TOKENS, $id);
	}
	
	public static function delete_password($id){
  	return sprintf("DELETE FROM `%s` WHERE user_id = %d;", TABLE_PASSWORDS, $id);
	}

}

?>