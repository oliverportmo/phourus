<?php

/** TABLE_NAMES **/
// App
define('TABLE_ADDRESS', "app_address");
define('TABLE_POSTS', 'app_posts');
define('TABLE_USERS', 'app_users');	
define('TABLE_ORGS', 'app_orgs');	
		
// User
define('TABLE_PASSWORDS', 'user_passwords');
define('TABLE_TOKENS', 'user_tokens');
		
// Posts	
define('TABLE_TAGS', 'meta_tags');
define('TABLE_LINKS', 'meta_links');

define('TABLE_BLOGS', 'post_blogs');
define('TABLE_EVENTS', 'post_events');	
define('TABLE_SUBJECTS', 'post_subjects');
define('TABLE_QUESTIONS', 'post_questions');
define('TABLE_ANSWERS', 'post_answers');
define('TABLE_DEBATES', 'post_debates');
define('TABLE_BILLS', 'post_bills');
define('TABLE_VOTES', 'post_votes');
define('TABLE_BELIEFS', 'post_beliefs');
define('TABLE_QUOTES', 'post_quotes');
define('TABLE_TIMELINE', 'post_timeline');

// Social		
define('TABLE_VIEWS', 'social_views');
define('TABLE_COMMENTS', 'social_comments');
define('TABLE_THUMBS', 'social_thumbs');
define('TABLE_FAVORITES', 'social_favorites');

// Orgs		
define('TABLE_MEMBERS', 'org_members');
define('TABLE_CLOUT', 'org_clout');
define('TABLE_REVIEWS', 'org_reviews');

class uUtilities
{
	
  public function splitter($model, $type='post'){ 	
  	if($type == 'user'){
  	  $pass = array();
  	  $pass['user_id']= 'LAST_INSERT_ID()';
  	  $pass['hash']= $model['hash'];
  	  
  	  $user = $model;
  	  unset($user['hash']);
  	  unset($user['password']);
  	  
  	  $out= array();
  	  $out['pass']= $pass;
  	  $out['user']= $user;
  	}else{ 
    	//posts table
    	$posts= array();
    	$posts['user_id']= $model['user_id'];
    	$posts['privacy']= $model['privacy'];
    	$posts['influence']= 0;
    	$posts['type']= $model['type'];
    	//detail table
    	$detail= $model;
    	$detail['post_id']= 'LAST_INSERT_ID()';
    	unset($detail['id']);
    	unset($detail['created']);
    	unset($detail['modified']);
    	unset($detail['user_id']);
    	unset($detail['privacy']);
    	unset($detail['influence']);
    	unset($detail['type']);
    	$out= array();
    	$out['posts']= $posts;
    	$out['detail']= $detail;
    	
  	}
  	return $out;	
	}
	
	public function pic($pic, $type, $id){
    $allowed= array("gif", "jpg", "png");
    $name= $pic['name'];
    $exp= explode('.', $name);
    $ext= end($exp);
    if($ext== 'jpeg'){
      $ext= 'jpg';
    }
    if(!in_array($ext, $allowed)){
      return $ext;
    }
    
    $update= false;
    if($type== 'user'){
      $update= oUser::update($id, array('img' => $ext));
    }else if($type== 'org'){
      $update= oOrg::update($id, array('img' => $ext));
    }
    if($update == false){
      return 'Update failed';
    }

    $upload= uUtilities::upload($id, $id.'.'.$ext, $type, $pic);
    return $upload;
	}
	
	public function upload($id, $filename, $type, $pic){
  	$dir= $_SERVER['DOCUMENT_ROOT'].'/assets/pics/'.$type.'s/';
  	
  	// delete
  	$exts= array("gif", "jpg", "png");
  	foreach($exts as $ext){
    	$current= $dir.$id.".".$ext;
    	if(file_exists($current)){
      	unlink($current);
    	}
  	}
  	
  	// upload
  	return move_uploaded_file($pic['tmp_name'], $dir.$filename);
	}
	
	/** PHASE OUT DYNAMIC TABLE NAMES WITH CONSTANTS **/	
	// Posts
	// Generic Get, Create, Read, Delete
	// Total, Owner, Schema
	public function table($type)
	{
		$tables= array();	
		
		// App
		$tables['address']= TABLE_ADDRESS;
		$tables['addresses']= TABLE_ADDRESS;
		$tables['post']= TABLE_POSTS;
		$tables['posts']= TABLE_POSTS;
		$tables['user']= TABLE_USERS;
		$tables['users']= TABLE_USERS;	
		$tables['org']= TABLE_ORGS;
		$tables['orgs']= TABLE_ORGS;	
		
		// Posts
		$tables['blogs']= TABLE_BLOGS;
		$tables['events']= TABLE_EVENTS;
		$tables['subjects']= TABLE_SUBJECTS;
		$tables['questions']= TABLE_QUESTIONS;
		$tables['answers']= TABLE_ANSWERS;
		$tables['debates']= TABLE_DEBATES;
		$tables['bills']= TABLE_BILLS;
		$tables['votes']= TABLE_VOTES;
		$tables['beliefs']= TABLE_BELIEFS;
		$tables['quotes']= TABLE_QUOTES;
		$tables['timeline']= TABLE_TIMELINE;
		
		// Social
		$tables['view']= TABLE_VIEWS;
		$tables['views']= TABLE_VIEWS;
		$tables['comment']= TABLE_COMMENTS;
		$tables['comments']= TABLE_COMMENTS;
		$tables['thumb']= TABLE_THUMBS;
		$tables['thumbs']= TABLE_THUMBS;
		$tables['favorite']= TABLE_FAVORITES;
		$tables['favorites']= TABLE_FAVORITES;
		
    // Users		
		$tables['password']= TABLE_PASSWORDS;
		$tables['passwords']= TABLE_PASSWORDS;
		$tables['token']= TABLE_TOKENS;
		$tables['tokens']= TABLE_TOKENS;
		
		// Orgs	
		$tables['clout']= TABLE_CLOUT;
		$tables['review']= TABLE_REVIEWS;
		$tables['reviews']= TABLE_REVIEWS;
		$tables['tag']= TABLE_TAGS;
		$tables['tags']= TABLE_TAGS;
		
		if(array_key_exists($type, $tables)){
			return $tables[$type];
		}
		return false;	
	}
	
	// Session
	public function token($length= 20, $charset='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'){
	    $str = '';
	    $count = strlen($charset);
	    while ($length--) {
	        $str .= $charset[mt_rand(0, $count-1)];
	    }
	    return $str;
	}
	
	public function expires(){
		date_default_timezone_set('UTC');
		$out = date( 'Y-m-d H:i:s', strtotime('+60 Minutes'));
		return $out;
	}
	
	public function decode($auth){
		$parsed= str_replace("Basic ", "", $auth);
		$decoded= base64_decode($parsed);
		$exploded= split(':', $decoded);
		$out= array();
		$out['username']= $exploded[0];
		$out['password']= $exploded[1];
		return $out;
	}
	

	public function now(){
    return date('Y-m-d H:i:s');	
	}
	
	/** LEGACY **/
	public static function pairs($model, $update= false){		
		$i= 0;
		$keys= '';
		$values= '';
		$out= '';
		
		if($update== true){
  		foreach($model as $key => $value)
  		{	
    		$value= uUtilities::values($key, $value);
    		$out.= "`$key` = $value, ";
      }
      $out= substr($out, 0, -2);
    }else if($update== false){
      foreach($model as $key => $value)
  		{	
  			if($i != 0)
  			{
  				$keys.= ', ';
  				$values.= ', ';
  			}
  			$value= uUtilities::values($key, $value);
  			$keys.= '`'.$key.'`';
  			$values.= $value;
  			$i= 1;
  		}
  		$out['keys']= str_replace('(, ', '', $keys);
  		$out['values']= str_replace('(, ', '', $values);	
    }
    return $out;
	}

	//Pairs- Key/value pre-processing
	public static function values($key, $value)
	{						
		switch($key)
		{	
			case 'id':
			  // If is empty, return empty
				if($value != '')
				{
				  // If not empty, but undefined, return empty
					if($value== 'undefined')
					{
						return "''";
					// Else return value
					}else{
						return $value;
					}
				}else{
					return "''";	
				}
			break;	
			case 'post_id':
			 if($value == 'LAST_INSERT_ID()'){
  			 return "LAST_INSERT_ID()";
			 }else{
  			 return $value;
			 }
		  case 'user_id':
			 if($value == 'LAST_INSERT_ID()'){
  			 return "LAST_INSERT_ID()";
			 }else{
  			 return $value;
			 }
			break;
			case 'created':
			  // On create, pass NULL or unset created field to set created to DEFAULT value (CURRENT_TIMESTAMP)
			  // On update, pass empty string or current value
				$match= preg_match('/[0-9]{4}-[0-9]{2}-[0-9]{2}/', $value);
			  if($match== true && $value != '0000-00-00 00:00:00'){
  			  return $value;
			  }
				return 'NULL';
			break;
			case 'modified':
			  $match= preg_match('/[0-9]{4}-[0-9]{2}-[0-9]{2}/', $value);
			  if($match== true && $value != '0000-00-00 00:00:00'){
  			  return $value;
			  }
			  return 'NOW()';
			break;	
			default:
				if($value== 'undefined'){
					return "''";
				}else if(is_array($value)){
					return "'".serialize($value)."'";
				}else{
					return "'".$value."'";
				}
			break;	
		}		
	}
	
	/*
		//type, api_key
	extract($args);
	case 'record':
			if($value!= '' && $value!= 'undefined')
			{
				$output['value']= "'".$value."'";
			}else{
				$record= create_uid(array('type' => $type));
				$output['value']= "'".$record['data']."'";
			}
			return $output;
		break;
		/** 
			-WHEN CREATING AN ENTRY, 'CREATED' MUST BE SET TO NULL IN ORDER TO SET CREATION TIME
			-WHEN MODIFYING AN ENTRY, THE 'CREATED' FIELD MUST BE OMITTED IN ORDER TO PREVENT THE AUTO-UPDATE
			CREATED- TIMESTAMP NOT NULL CURRENT_TIMESTAMP
			MODIFIED- TIMESTAMP NOT NULL DEFAULT 0
			USE NOW() WITHOUT QUOTES TO SET MODIFIED TO CURRENT DATE/TIME
		**/	
	
	//UID- Server-side UID implementation to be removed, replaced with DB trigger, composite key, or auto-increment
	/*
	private function create_uid($args)
	{	
		//type, api_key
		extract($args);
		
		$pre= substr($type, 0, 3);
		$pre= strtoupper($pre);
		$table= $type;
		$date= date('ymd');
		/** ===== 'uid' Query ===== **
		$query= "SELECT record FROM ".table($table)." WHERE record LIKE '".$pre."-".$date."%' ORDER BY id DESC";
		$result= @mysql_query($query);
		
		$row= @mysql_fetch_array($result);
		if(!$row)
		{
			$uid= $pre.'-'.$date.'-001-A';
			$output['data']= $uid;
			return $output;
		}else{
			$temp= split('-', $row[0]);
			$i= intval($temp[2]);
			$group= $temp[3];
			if($i == 999)
			{
				$number= 1;
				$group++;
			}else{
				$number= ($i+1);	
			}
			$number= pad_zeros($number);
			$uid= $pre.'-'.$date.'-'.$number.'-'.$group;
			$output['data']= $uid;
			return $output;
		}
	}
	
	private function pad_zeros($number)
	{
		if(strlen($number) == 1)
		{
			return '00'.$number;	
		}else if(strlen($number) == 2)
		{
			return '0'.$number;	
		}else if(strlen($number) == 3)
		{
			return $number;	
		}else{
			return $number;	
		}
	}	*/
	
		/** PERMISSION **/
	public static function owner($auth_id, $resource){
  	$q= qOther::owner($auth_id, $resource);
  	$result= new uResult();
  	$out= $result->r_single($q);
  	return $out;
	}
		
	/** SPECIAL **/
	public function special($params){
  	if(!is_array($params)){
      return 400;	
  	}
  	$result= new uResult();
  	extract($params);
  	switch($mode){
    	case 'states':
        $q= qOrg::states($params['type']);
        $out= $result->r_read($q);
    	break;
    	case 'recent':
    	
    	break;
    	default:
    	 return 404;
    	break;
  	}        
  	return $out;
	}
	
	/** SCHEMA **/
	public function schema($tables= ''){
		if($tables== ''){
  		$tables= self::default_schema();
		}
		foreach($tables as $table){
  		$q= qOther::schema($table);
  		$result= new uResult();
  		$out[$table]= $result->r_read($q);
		}
		return $out;
	}
	
	private function default_schema(){
  	$out= array();
  	array_push($out, 'blogs');
  	array_push($out, 'ideas');
  	array_push($out, 'links');
  	array_push($out, 'events');
  	
  	array_push($out, 'checklist');
  	array_push($out, 'calculator');
  	array_push($out, 'matters');
  	
  	array_push($out, 'subjects');
  	array_push($out, 'questions');
  	array_push($out, 'answers');
  	
  	array_push($out, 'debates');
  	array_push($out, 'bills');
  	array_push($out, 'votes');
  	
  	array_push($out, 'beliefs');
  	array_push($out, 'timeline');
  	array_push($out, 'quotes');
  	return $out;
	}

}
	
?>