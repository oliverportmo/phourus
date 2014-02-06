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
    $meta= dRead::meta($id);
		if(is_numeric($meta)){
  		return $meta;
		}
		$post= dRead::post($id, $meta['type']);
		if(is_numeric($post)){
  		return $post;
		}
		$user= oUser::get(array('id' => $meta['user_id']));
		$stats= oStats::stats(array('post_id' => $id));
		$address= dRead::address(array('user_id' => $meta['user_id']));
		
		$out= array();
		$out['meta']= $meta;
		$out['post']= $post;
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
    $when = self::when($params);
    $paging = self::paging($params);
    $exploded = explode(";", $params['types']);
    
    // Query
		foreach($exploded as $k => $v){
		  $t= uUtilities::table($v); 
  		
  		// Search
  		$search = self::search($params['search'], $t); 
  		
  		// Sorting
  		$sort_field = "app_posts.influence AS sort";
  		$sort_join = '';
  		if($params['sort'] == 'comments' || $params['sort'] == 'thumbs' || $params['sort'] == 'views'){
    		$sort = $params['sort'];
    		$sort_field = "COUNT(app_$sort.id) AS sort";
    		$sort_join = "LEFT JOIN `app_$sort` ON app_posts.id = app_$sort.post_id";
  		}
  		$fields = "app_posts.id AS id, $sort_field";
  		
  		// Select 
  		$select = "SELECT $fields FROM `app_posts`";
  		
  		// Join
  		$join = "INNER JOIN `$t` ON app_posts.id = $t.post_id $sort_join";
  		
  		// Query
  		$q.= "$select $join $privacy $search $when UNION "; 
		}
		// Remove last UNION
		$q = substr($q, 0, -7);
		
		// Closer
		if($params['count'] == true){
		  $closer= ') AS total';
		}else{
  		if($direction != 'ASC'){ $direction = 'DESC'; }
  		$closer= ") AS x ORDER BY sort $direction $paging";
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
	
  private function privacy($params){	
		$mode = $params['mode'];
		switch($mode){
		  case 'user':
		    $user_id = $params['user_id'];
		    return "WHERE app_posts.privacy = 'public' AND app_posts.user_id = '$user_id'";
		  break;
		  case 'org':
		    $org_id = $params['org_id'];
		    $members= dRead::community(array('mode' => 'id', 'org_id' => $org_id));
		    if(is_numeric($members)){
      		return $members;
    		}
    		foreach($members as $member){
    		  $in.= $member['id'].",";
    		}
    		$in= substr($in, 0, -1);
		    return "WHERE app_posts.privacy = 'public' AND app_posts.user_id IN($in)";
		  break;
		  case 'me':
		    if(isset($GLOBALS['phourus_auth_id'])){
  		    $auth_id= $GLOBALS['phourus_auth_id'];
  		    return "WHERE app_posts.user_id = '$auth_id'";
  		  }else{
  		    return "WHERE app_posts.privacy = 'public'";
  		  }
		  break;
		  default:
		    return "WHERE app_posts.privacy = 'public'";
		  break;
		}
		
		/** ADVANCED **/
		  /*$relationships= oUser::relationships($auth_id);
      extract($relationships);
  		if($following == ""){ $following= "'0'"; }
  		if($followers == ""){ $followers= "'0'"; }
  		if($friends == ""){ $friends= "'0'"; }
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
  	extract($params);
  	if(isset($date_start)){
      $out.= "app_posts.created > $date_start"; 
  	} 
  	if(isset($date_end)){
      $out.= "app_posts.created < $date_end";	
  	}
  	return $out;
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