<?php

class oPost
{		
	
	# GET
	public function get($params){
		if(isset($params['id'])){
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
		}else{   		
		  $out= dRead::posts($params);
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
		
	/** PARAMS **/
	static public function params($params){
		//types, page, limit, field, asc, mode, date
		extract($params);
		
		//$ids= self::search($search);
		$ids = '';
		
		$out= array();
		$out['mode']= self::mode($params);
		$out['types']= self::types($types);
		$out['order']= self::order($field, $asc);
		$out['paging']= self::paging($page, $limit);		
		if($mode== 'user' && isset($author_id)){
  		$out['author']= self::author($author_id);	
		}
		if(isset($users)){
  		$out['users']= self::users($users);
		}else{
  		$out['users']= '';
		}
		//$params['when']= $this->when();				
		return $out;
	}
	
  private function mode($params){	
		/** EXCLUDE CURRENT USER **/
		$mode = $params['mode'];
		$search = $params['search'];
		$auth_id= 0;
		if(isset($GLOBALS['phourus_auth_id'])){
		  $auth_id= $GLOBALS['phourus_auth_id'];
		}
				
		if($search != ''){
		  $ids = self::search($params);
  		$search = "AND id IN($ids)";
		}
		$select= "SELECT id FROM app_posts WHERE user_id != '$auth_id' $search ";
		$relationships= oUser::relationships($auth_id);
    extract($relationships);
		if($following == ""){ $following= "'0'"; }
		if($followers == ""){ $followers= "'0'"; }
		if($friends == ""){ $friends= "'0'"; }
		
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
  		  return $select;
  		break;
  		case 'me':
  		  //WHERE post.user_id = $user_id
  		  //if($user_id = $GLOBALS['user_id']){}
  		  //$out= self::advanced(array('user_id', 'EQUALS', '1', ''));
  		  return "SELECT id FROM app_posts WHERE app_posts.user_id = '$auth_id'";  
  		break;
  		default: 
  		  return "$select AND privacy = 'public'";
  		break;
    }
	}

	private function types($types){
		$formatted= str_replace(";", "','",  $types);
		$string= "'$formatted'";
		return "AND type IN($string) ";
	}
		
	private function order(){
		/*if($sort== null)
		{
			return '';
		}
		$direction= 'DESC';
		if($this->_asc== true)
		{
			$direction= 'ASC';	
		}
		return "ORDER BY ".$this->_sort." ".$direction;*/
	}	
	
	//Paging
	private function paging($page, $limit= 10){		
		//If no 'page' param is set, omit paging altogether
		if($page== null || $page < 1)
		{
			return '';	
		}
		return '';
		
		$offset= $page * $limit;
		return "LIMIT $offset, $limit";	 
	}
	
	private function author($author_id){
	  $privacy= "'followers','following'";
  	return "AND user_id = '$author_id' AND privacy IN('public'$privacy)";
	}
	
	private function users($users){
	  $list= "";
  	return "AND user_id IN ($users)";
	}
	
	private function search($params){
    extract($params);
    if($search == ''){
      return '';
    }
    $trimmed = preg_replace('/\s\s+/', ' ', $search);
    $s = str_replace(" ", "%", $trimmed);
    
    $exploded = explode(";", $types);
    $q = '';
    
		foreach($exploded as $k => $v){
		  $t= uUtilities::table($v); 
		  // answers: no title, quotes: no title, votes: no title, bills: no title
		  switch($v)
		  {
  		  case 'answers':
  		  
  		  break;
  		  case 'bills':
  		  
  		  break;
  		  case 'votes':
  		  
  		  break;
  		  case 'quotes':
  		  
  		  break;
  		  default:
  		    $q.= "SELECT post_id FROM $t WHERE title LIKE '%$s%' OR content LIKE '%$s%' UNION ";
  		  break;
		  }
		  
		}
		
		$q = substr($q, 0, -7);
		$q.= ';';
		
		$result= new uResult();
		$ids= $result->r_read($q);
		if(is_numeric($ids)){
  		return '';
		}
		$out= '';
		foreach($ids as $i){
		  $out.= $i['post_id'].',';
		}
    return substr($out, 0, -1);
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