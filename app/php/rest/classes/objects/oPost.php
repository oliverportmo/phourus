<?php

class oPost
{		
	
	# GET
	public function get($params){
		if(isset($params['id'])){
		  return self::single($params['id']);
		}
		return dRead::posts($params);	
	}
	
	public function single($id){
    $post= dRead::post($id);
		if(is_numeric($post)){
  		return $post;
		}
		$meta= dRead::meta($id, $post['type']);
		if(is_numeric($meta)){
  		return $meta;
		}
		$user= oUser::get(array('id' => $post['user_id']));
		$stats= oStats::stats(array('post_id' => $id));
		$address= dRead::address(array('user_id' => $post['user_id']));
		
		$out= array();
		$out['post']= $post;
		$out['meta']= $meta;
		$out['stats']= $stats;
		$out['user']= $user;		  
		return $out;
	}
	
	# POST
	public function create($model){
		$out= dCreate::post($model);	
		return $out;
	}
	
	# PUT
	public function update($id, $model){
		$out= dUpdate::post($id, $model);
		return $out;
	}
	
	# DELETE
	public function delete($id){
		$out= dDelete::post($id);
		return $out;
	}
	
	# TOTAL 
	public function total($params){
  	$out= dRead::total($params);
  	return $out;
	}
		
	/** PARAMS **/
	static public function q($params){
    // Selector
    $selector= 'id, sort';    
    if($params['count']== true){
      $selector= 'COUNT(*)';  
    }
    $q= "SELECT $selector FROM (";
    
    // Params
    $privacy = self::privacy($params);
    $mode = self::mode($params);
    $when = self::when($params);
    $paging = self::paging($params);
    $exploded = explode(";", $params['types']);
    
    // Query
		foreach($exploded as $k => $v){
		  $t= uUtilities::table($v); 
  		
  		// Search
  		$search = self::search($params['search'], $t); 
  		
  		// Sorting
  		$sort_field = sprintf("%s.influence AS sort", TABLE_POSTS);
  		$sort_join = '';
  		if($params['sort'] == 'comments' || $params['sort'] == 'thumbs' || $params['sort'] == 'views'){
    		$sort = $params['sort'];
    		$sort_field = sprintf("COUNT(app_%s.id) AS sort", $sort);
    		$sort_join = sprintf("LEFT JOIN `app_%s` ON %s.id = app_%s.post_id", $sort, TABLE_POSTS, $sort);
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
		if($params['count'] == true){
		  $closer= ') AS total';
		}else{
  		if($direction != 'ASC'){ $direction = 'DESC'; }
  		$closer= sprintf(") AS x ORDER BY sort %s %s" $direction, $paging);
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
		
	// When	
	private function when($params){
  	return '';
  	$out= '';
  	if(isset($params['date_start'])){
      $out.= sprintf("%s.created > %s", TABLE_POSTS, $params['date_start']); 
  	} 
  	if(isset($params['date_end'])){
      $out.= sprintf("%s.created < %s", TABLE_POSTS, $params['date_end']);	
  	}
  	return $out;
	}	
	
	//Paging
	private function paging($params){	
		$page = isset($params['page']) && $params['page'] > 1 ? $params['page'] : 0;
		$limit = isset($params['limit']) ? $params['limit'] : 20;
		$offset= $page * $limit;
		return sprintf("LIMIT %d, %d", $offset, $limit);	 
	}
	
	/** GENERIC **/
	private function selector(){
		$selector= '*';
		if($unique != NULL && $unique != '')
		{
			$selector= 'DISTINCT('.$unique.')';	
		}
		return $selector;
	}
		
	private function advanced($input){
		if(!is_array($input))
		{
			return '';	
		}
		if(!is_array($input[0])){
			$input= array($input);
		}
		$end= end($input);
		foreach($input as $row)
		{
			$field= $row[0];
			$operator= $row[1];
			$value= mysql_real_escape_string($row[2]);
			$logic= $row[3];
			switch($operator)
			{
				case 'EQUALS':
					$operator= '=';
				break;
				case 'NOT EQUALS':
					$operator= '!=';
				break;
				case 'LIKE':
					$operator= 'LIKE';
				break;
				case 'CONTAINS':
					$operator= 'IN';
				break;
				case 'GREATER THAN':
					$operator= '<';
				break;
				case 'LESS THAN':
					$operator= '>';
				break;
				case 'GREATER THAN EQUAL':
					$operator= '>=';
				break;
				case 'LESS THAN EQUAL':
					$operator= '<=';
				break;
				default:
					continue;
				break;
			}
			if($end== $row)
			{
				$logic= '';	
			}
			if($value== 'null')
			{
				$operator= 'IS';
				$value= 'NULL';
			}
			if($value != '')
			{
				$out.= sprintf("`%s` %s '%s' %s", $field, $operator, $value, $logic);
			}
		}
		return 'AND '.$out;	
	}	
	
	# OTHER
	public static function stats($post_id, $type){
  	$out= dRead::post_stats($post_id, $type);
  	return $out;
	}
	
	public static function comments($post_id, $type){
  	$out= dRead::comments($post_id, $type);
	} 
	
		/** PRIVATE **/
	/*private function privacy($privacy= false){
		$out= "WHERE privacy != -1 ";
		if($privacy== true)
		{
			$out= "WHERE privacy = -1 ";
		}
		return $out;
	}*/
}

?>