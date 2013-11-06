<?php

class dCreate {
	
	# POST
	public static function post($model){
		$split= uUtilities::splitter($model);
		
		$p= uQueries::create($split['posts'], 'posts');
		$d= uQueries::create($split['detail'], $model['type']);	
		$q[]= $p;
		$q[]= $d;
		$q= $p.$d;
		 
		$result= new uResult();
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
		$model['id']= uUtilities::token();
		$model['expires']= uUtilities::expires();
		$q= uQueries::session_create($model, 'tokens');
		$result= new uResult();
		$create= $result->r_create($q);
		$out= oSession::get(array('X_API_KEY' => $model['id'], 'FROM' => $model['user_id']));
		return $out;
	}
}

?>