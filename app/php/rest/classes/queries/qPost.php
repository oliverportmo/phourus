<?php

class qPost {
  
  # post
	public static function post($params){		 
		return sprintf("SELECT * FROM `%s` WHERE id = %d;", TABLE_POSTS, $params['id']);
	}
	
	# meta
	public static function meta($params){	
		return sprintf("SELECT * FROM `%s` WHERE post_id = %d;", uUtilities::table($params['type']), $params['post_id']);
	}
		
	# update
	public static function update($id, $type, $model){
		$table= uUtilities::table($type);
		$pairs= uUtilities::pairs($model, true); 
		return sprintf("UPDATE `%s` SET %s WHERE post_id = %d;", $table, $pairs, $id);		
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
		return sprintf("SELECT * FROM `%s` %s;", TABLE_TAGS, $where);
	}
	
	# total
	public static function total($params){
  	$params['count']= true;
  	return self::posts($params);
	}
	
	# posts: count, search, page, limit, types, mode,
  public static function posts($params){
    // Selector
    $selector= 'id, sort';    
    if(isset($params['count']) && $params['count']== true){
      $selector= 'COUNT(*)';  
    }
    $q= "SELECT $selector FROM (";
    
    // Params
    $when = uQuery::when($params);
    $paging = uQuery::paging($params);
    $privacy = self::privacy($params);
    $mode = self::mode($params);
    $exploded = explode(";", $params['types']);
    
    // Query
		foreach($exploded as $k => $v){
		  $t= uUtilities::table($v); 
  		
  		// Search
  		$search= isset($params['search']) ? self::search($params['search'], $t) : ''; 
  		
  		// Sorting
  		$sort_field = sprintf("%s.influence AS sort", TABLE_POSTS);
  		$sort_join = '';
  		if(isset($params['sort'])){
    		if($params['sort'] == 'comments' || $params['sort'] == 'thumbs' || $params['sort'] == 'views'){
      		$sort = $params['sort'];
      		$sort_field = sprintf("COUNT(app_%s.id) AS sort", $sort);
      		$sort_join = sprintf("LEFT JOIN `app_%s` ON %s.id = app_%s.post_id", $sort, TABLE_POSTS, $sort);
    		}
  		}
  		$fields = sprintf("%s.id AS id, %s", TABLE_POSTS, $sort_field);
  		
  		// Select 
  		$select = sprintf("SELECT %s FROM `%s`", $fields, TABLE_POSTS);
  		
  		// Join
  		$join = sprintf("INNER JOIN `%s` ON %s.id = %s.post_id %s", $t, TABLE_POSTS, $t, $sort_join);
  		
  		// Query
  		$q.= sprintf("%s %s %s %s %s %s UNION ", $select, $join, $privacy, $mode, $search, $when); 
		}
		// Remove last UNION
		$q = substr($q, 0, -7);
		
		// Closer
		if(isset($params['count']) && $params['count'] == true){
		  $closer= ') AS total';
		}else{
  		$direction= (isset($params['direction']) && $params['direction'] != 'ASC') ? 'DESC' : 'ASC';
  		$closer= sprintf(") AS x ORDER BY sort %s %s", $direction, $paging);
		}	
		$q.= $closer;
		return $q;
	}
		
	private function search($search, $table){
    if($search == ''){
      return '';
    }
    $trimmed = preg_replace('/\s\s+/', ' ', $search);
    $s = str_replace(" ", "%", $trimmed);
    $s = "'%$s%'";
    		
		// answers: no title, quotes: no title, votes: no title, bills: no title
    switch($table)
		  {
  		  case 'mind_answers':
  		    return sprintf("AND %s.content LIKE %s", $table, $s);
  		  break;
  		  case 'voice_bills':
  		    return sprintf("AND %s.question LIKE %s OR %s.content LIKE %s", $table, $s, $table, $s);
  		  break;
  		  case 'voice_votes':
  		    return sprintf("AND %s.content LIKE %s", $table, $s);
  		  break;
  		  case 'self_quotes':
  		    return sprintf("AND %s.quote LIKE %s OR %s.author LIKE %s", $table, $s, $table, $s);
  		  break;
  		  default:
  		    return sprintf("AND %s.title LIKE %s OR %s.content LIKE %s", $table, $s, $table, $s);
  		  break;
  		}
	}
	
  private function privacy($params){	
		$auth_id = 0;
		$mode = $params['mode'];
		$privacy = "";
		if(isset($GLOBALS['phourus_auth_id'])){
  		$auth_id = $GLOBALS['phourus_auth_id'];
  		$values= "'public','phourus'"; 
  		if($mode == 'me'){
    	  $values.= ",'private'";
  		}
		}else{
  		$values = "'public'";
		}	
		$out = "WHERE ".TABLE_POSTS.".privacy IN($values)";
		return $out;
  }
		
  private function mode($params){
    $mode = $params['mode'];
    
    $auth_id = 0;
		if(isset($GLOBALS['phourus_auth_id'])){
  		$auth_id = $GLOBALS['phourus_auth_id'];
  		$relationships= oUser::relationships($auth_id, true);
  		extract($relationships);
    }
		
		switch($mode){
		  case 'phourus':
		    if(isset($auth_id) && $auth_id > 0){
  		    return sprintf("AND %s.user_id NOT IN(%s,%s,%s,%s)", TABLE_POSTS, $auth_id, $followers, $following, $friends);
		    }
		    return "";
		  break;
		  case 'user':
		    $user_id = $params['user_id'];
		    return sprintf("AND %s.user_id = %d", TABLE_POSTS, $user_id);
		  break;
		  case 'org':
		    $org_id = $params['org_id'];
		    $members= dRead::community(array('mode' => 'id', 'org_id' => $org_id));
		    if(is_numeric($members)){
      		return $members;
    		}
    		foreach($members as $member){
    		  $community.= $member['id'].",";
    		}
    		$community= substr($community, 0, -1);
		    return sprintf("AND %s.user_id IN(%s)", TABLE_POSTS, $community);
		  break;
		  case 'fans':
		    return sprintf("AND %s.user_id IN(%s)", TABLE_POSTS, $followers);
		  break;
		  case 'favs':
		    return sprintf("AND %s.user_id IN(%s)", TABLE_POSTS, $following);
		  break;
		  case 'friends':
		    return sprintf("AND %s.user_id IN(%s)", TABLE_POSTS, $friends);
		  break;
		  case 'me':
		    if($auth_id != 0){
  		    return sprintf("AND %s.user_id = %d", TABLE_POSTS, $auth_id);
  		  }
  		  return 401;
		  break;
		  default:
		    return 400;
		  break;
		}
		
		/** ADVANCED **/
	  /*
	  case 'following':	  
		  return "$select AND privacy IN('followers', 'public') AND user_id IN($following) AND user_id NOT IN($friends)";
		break;
		case 'followers':
		  return "$select AND privacy IN('following', 'public') AND user_id IN($followers) AND user_id NOT IN($friends)";
		break;
		case 'friends':  
		  return "$select AND privacy IN('following', 'followers', 'friends', 'public') AND user_id IN($friends)";
		break;
		*/
	}
}

?>