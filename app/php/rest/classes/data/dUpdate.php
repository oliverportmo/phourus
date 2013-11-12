<?php

class dUpdate {
	
	public static function update($id, $type, $model){
    $original= self::get($id, $type);
    if(is_numeric($original)){
      return $original;
    }
    
    $q= uQueries::update($id, $type, $model);
    $result= new uResult();
    $update= $result->r_update($q);
    if(is_numeric($update)){
      return $update;
    }
    
    $current= self::get($id, $type);
    $status= self::status($current, $model);
    
    $out['id']= $id;
    $out['model']= $model;
    $out['original']= $original;
    $out['current']= $current;
    $out['status']= $status;
    return $out;	
	}
	
	/** SPECIAL **/
	public static function post($id, $model){    
    $original= oPost::get(array('id' => $id));
    if(is_numeric($original)){
      return false;
    }
    $split= uUtilities::splitter($model);

    $posts= array();
		$posts['privacy']= $split['posts']['privacy'];
		
		$p= uQueries::update($id, 'posts', $posts);
		
		unset($split['detail']['post_id']);
		$d= uQueries::update_post($id, $model['type'], $split['detail']);	
		$queries[]= $p;
		$queries[]= $d;
		 
		$result= new uResult();
		$update= $result->r_update($queries, true);
		if(is_numeric($update)){
  		return $update;
		}
		$current= oPost::get(array('id' => $id));
		
		$out['id']= $id;
    $out['model']= $model;
    $out['original']= $original;
    $out['current']= $current;
    $out['status']= self::status($current, $model);
		return $out;
	}
	
	public static function influence($params, $influence){
	  $model= array('influence' => $influence);
	  extract($params);
	  if(isset($post_id)){ $type= 'post'; $id= $post_id; }
	  if(isset($user_id)){ $type= 'user'; $id= $user_id; }
	  if(isset($org_id)){ $type= 'org'; $id= $org_id; }
	  if(!isset($type) || !isset($id)){ return false; }
	  
	  $q= uQueries::update($id, $type, $model);
    $result= new uResult();
    $out= $result->r_update($q);
    return $out;
	}
	
	/** PRIVATE **/
	private function status($current, $model){
  	if(is_array($current) && is_array($model)){
    	foreach($model as $key => $value){
      	if($current[$key]!= $value){
      	 return false;
      	}
    	}
    	return true;
  	}	
  	return false;
	}
	
	private function get($id, $type){
  	$q= uQueries::get($id, $type);
		$result= new uResult();
		$out= $result->r_single($q);
		return $out;
	}
}

?>