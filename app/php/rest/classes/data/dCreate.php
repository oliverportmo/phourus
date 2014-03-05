<?php

class dCreate {
	
	# tag, address, reviews, clout, follows, comments, thumbs, views, orgs, users
	public static function create($model, $type){
  	$q= qBase::create($model, $type);
		$result= new uResult();
		$id= $result->r_create($q);
		return $id;
	}
	
	# POST
	public static function post($model){
		$split= uUtilities::splitter($model);
		
		$p= qBase::create($split['posts'], 'posts');
		$d= qBase::create($split['detail'], $model['type']);	
		$queries[]= $p;
		$queries[]= $d;
		//$q= $p.$d;
		 
		$result= new uResult();
		$create= $result->r_create($queries, true);
		if($create['id']){	
  		return $create;
		} 
		return 503;
	}	
	
	# USER
	public static function user($model){
		$split= uUtilities::splitter($model, 'user');
		
		$u= qBase::create($split['user'], 'users');
		$p= qBase::create($split['pass'], 'passwords');	
		$queries[]= $u;
		$queries[]= $p;
		
		$result= new uResult();
		$create= $result->r_create($queries, true);
		return $create;
	}	
	
	# SESSION
	public static function session($user_id){
		$model['user_id']= $user_id;
		$model['id']= uUtilities::token();
		$model['expires']= uUtilities::expires();
		$q= qSession::session_create($model, 'tokens');
		$result= new uResult();
		$create= $result->r_create($q);
		$out= oSession::get(array('X_API_KEY' => $model['id'], 'FROM' => $model['user_id']));
		return $out;
	}
}

?>