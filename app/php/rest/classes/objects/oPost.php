<?php

class oPost
{		
	
	# GET
	public function get($params){
		if(!isset($params['id'])){
		  $out= dRead::posts($params);
		}else{
  		$meta= dRead::meta($params['id']);
  		if(is_numeric($meta)){
    		return $meta;
  		}
  		$post= dRead::post($meta['id'], $meta['type']);
  		if(is_numeric($post)){
    		return $post;
  		}
  		$user= oUser::get(array('id' => $meta['user_id']));
  		$stats= oStats::stats(array('post_id' => $meta['id']));
  		$address= dRead::address(array('user_id' => $meta['user_id']));
  		
  		$out= array();
  		$out['meta']= $meta;
  		$out['post']= $post;
  		$out['stats']= $stats;
  		$out['user']= $user;		  
		}
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
    $q = '';
    if($params['count']== true){
      $q.= 'SELECT COUNT(*) FROM (';
    }
    $p = self::params($params);
    extract($p);
    $exploded = explode(";", $params['types']);
		foreach($exploded as $k => $v){
		  $t= uUtilities::table($v); 
  		$search = self::search($params['search'], $t); 
  		$field = 'app_posts.id';
  		$select = "SELECT $field FROM `app_posts`";
  		$join = "INNER JOIN `$t` ON app_posts.id = $t.post_id";
  		$q.= "$select $join $privacy $search $when UNION "; 
		}
		$q = substr($q, 0, -7);
		// order requires field present in query
		//$q.= $order." ";
		if($params['count'] != true){
  		$q.= $paging;
		}else{
  		$q.= ') AS total'; 
		}
		return $q;
	}
	
	static public function params($params){
		//types, page, limit, field, asc, mode, date, search
		extract($params);
		
		$out= array();
		$out['privacy']= self::privacy($mode);
		// types() no longer needed?
		//$out['types']= self::types($types);
		// search is custom per table
		$out['when']= self::when($params);
		$out['order']= self::order($params);
		$out['paging']= self::paging($params);	
		return $out;
	}
	
	private function search($search, $table){
    if($search == ''){
      return '';
    }
    $trimmed = preg_replace('/\s\s+/', ' ', $search);
    $s = str_replace(" ", "%", $trimmed);
    		
		// answers: no title, quotes: no title, votes: no title, bills: no title
    switch($table)
		  {
  		  case 'mind_answers':
  		    return "AND $table.content LIKE '%$s%'";
  		  break;
  		  case 'voice_bills':
  		    return "AND $table.question LIKE '%$s%' OR $table.content LIKE '%$s%'";
  		  break;
  		  case 'voice_votes':
  		    return "AND $table.content LIKE '%$s%'";
  		  break;
  		  case 'self_quotes':
  		    return "AND $table.quote LIKE '%$s%' OR $table.author LIKE '%$s%'";
  		  break;
  		  default:
  		    return "AND $table.title LIKE '%$s%' OR $table.content LIKE '%$s%'";
  		  break;
  		}
	}
	
  private function privacy($mode){	
		// Get current logged in user
		$auth_id= 0;
		if(isset($GLOBALS['phourus_auth_id'])){
		  $auth_id= $GLOBALS['phourus_auth_id'];
		  $exclude= "WHERE user_id != '$auth_id'";
		  /*$relationships= oUser::relationships($auth_id);
      extract($relationships);
  		if($following == ""){ $following= "'0'"; }
  		if($followers == ""){ $followers= "'0'"; }
  		if($friends == ""){ $friends= "'0'"; }*/
		}else{
  		return "WHERE 1 = 1";
		}		
		
		return $exclude;
		/*
		
		if(isset($users)){
  		$out['users']= self::users($users);
  		private function users($users){
	  $list= "";
  	return "AND user_id IN ($users)";
	}
		if($search != ''){
		  $ids = self::search($params);
  		$search = "AND id IN($ids)";
		}
  		  //WHERE post.user_id = $user_id
  		  //if($user_id = $GLOBALS['user_id']){}
  		  //$out= self::advanced(array('user_id', 'EQUALS', '1', ''));
  		  return "SELECT id FROM app_posts WHERE app_posts.user_id = '$auth_id'";  
  		break;
  		default: 
  		  return "$select AND privacy = 'public'";
  		break;
    }
		}else{
  		$out['users']= '';
		}
		
		
		
		
		$in= '';
		if(isset($params['org_id']) && $params['org_id'] != 0){
  		$members= dRead::community(array('mode' => 'id', 'org_id' => $params['org_id']));	
  		if(is_numeric($members)){
    		return $members;
  		}
  		foreach($members as $member){
  		  $in.= $member['id'].",";
  		}
  		$in= substr($in, 0, -1);
  		return "$select AND privacy IN('following', 'followers', 'friends', 'public') AND user_id IN($in)";
    }
    
    

		switch($mode){
  		case 'phourus':
  		  // Should followers/following be included??
  		  $exclude= '';
  		  $merged= trim($following.$followers, ',');
  		  if(count($merged) > 1){
    		  $exclude= "AND user_id NOT IN($merged)";
  		  }
  		  return "$select AND privacy = 'public' $exclude";
  		break;
  		case 'following':	  
  		  return "$select AND privacy IN('followers', 'public') AND user_id IN($following) AND user_id NOT IN($friends)";
  		break;
  		case 'followers':
  		  return "$select AND privacy IN('following', 'public') AND user_id IN($followers) AND user_id NOT IN($friends)";
  		break;
  		case 'friends':  
  		  return "$select AND privacy IN('following', 'followers', 'friends', 'public') AND user_id IN($friends)";
  		break;
  		case 'user':
  		  //WHERE post.user_id = $user_id AND post.privacy = 'public' OR post
  		  //$out= self::advanced(array('user_id', 'EQUALS', '2', ''));
  		  //$filter= 'public';
  		  //if(isset($following) && $following== true){ $filter.= ",following"; }
  		  //if(isset($follower) && $follower = true){ $filter.= ",followers"; }
  		  //return "SELECT post_id FROM app_posts WHERE user_id = $user_id AND privacy IN();";
  		  if(isset($author_id)){
      		$out['author']= self::author($author_id);	
    		}
  		  return $select;
  		break;
  		case 'me':
  		
		private function author($author_id){
	  $privacy= "'followers','following'";
  	return "AND user_id = '$author_id' AND privacy IN('public'$privacy)";
	}
	
	 */
	}

	private function types($types){
		$formatted= str_replace(";", "','",  $types);
		$string= "'$formatted'";
		return "AND type IN($string) ";
	}
		
	// When	
	private function when($params){
  	/*if(isset($params['date_start']) && isset($params['date_end']) && $params['date_start'] < $params['date_end']){
    	return "AND app_posts.created BETWEEN $params['date_start'] AND $params['date_end']";
  	}*/
  	return '';
	}	
	
	// Order
	private function order($params){
		extract($params);
		if($sort== null)
		{
			$sort = 'app_posts.influence';
		}
		if($direction== null)
		{
			$direction= 'DESC';	
		}
		return "ORDER BY $sort $direction";
	}	
	
	//Paging
	private function paging($params){	
    extract($params);	
		//If no 'page' param is set, set page to 0
		if($page== null || $page < 1)
		{
			$page = 0;	
		}
		if($limit== null){
  		$limit = 10;
		}
		
		$offset= $page * $limit;
		return "LIMIT $offset, $limit";	 
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
  	$out= dRead::stats_post($post_id, $type);
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