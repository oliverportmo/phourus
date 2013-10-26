<?php

class dCreate {
	
	# POST
	public static function post($model){
		//split model
		$split= self::splitter($model);
		
		$posts= uUtilities::pairs($split['posts']);
		$posts['table']= uUtilities::table('posts');
		$p= uQueries::create($posts);
		
		$detail= uUtilities::pairs($split['detail']);
		$detail['table']= uUtilities::table($model['type']);
		$d= uQueries::create($detail);
		$result= new uResult();
		$q= $p.$d;
		$out= $result->r_create($q, true);
		return $out;
	}	

	# tag, address, reviews, clout, follows, comments, thumbs, views, orgs, users
	public static function create($model, $type){
  	$q= uQueries::create($model, $type);
		$result= new uResult();
		$id= $result->r_create($q);
		return $id;
	}
	
	# SESSION
	public static function session($user_id){
		$model['user_id']= $user_id;
		$model['token']= uUtilities::token();
		$model['expires']= uUtilities::expires();
		$q= uQueries::session_create($model, 'tokens');
		$result= new uResult();
		$session= $result->r_create($q);
		return $session;
	}
	
	/** PRIVATE **/
  private function splitter($model){
  	//posts table
  	$posts= array();
  	$posts['id']= '';
  	$posts['created']= '';
  	$posts['modified']= '';
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
  	return $out;	
	}
}

?>