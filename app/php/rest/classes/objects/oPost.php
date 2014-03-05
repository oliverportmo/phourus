<?php

class oPost
{		
	
	# GET
	public static function get($params){
		if(isset($params['id'])){
		  $q= qPost::post($params);
  		$post= dRead::single($q);
  		return self::full($post);
		}
		$q= qPost::posts($params);
		$posts= dRead::collection($q);
		if(is_numeric($posts)){
  		return $posts;
		}
		foreach($posts as $i){	
			$out[]= oPost::get(array('id' => $i['id']));
		}
		return $out;		
	}
	
	# POST
	public static function create($model){
		$out= dCreate::post($model);	
		return $out;
	}
	
	# PUT
	public static function update($id, $model){
		$out= dUpdate::post($id, $model);
		return $out;
	}
	
	# DELETE
	public static function delete($id){
		$out= dDelete::post($id);
		return $out;
	}
	
	# FULL
	public function full($obj){
	 if(is_numeric($obj)){
  		return $obj;
		}
		$q= qPost::meta(array('post_id' => $obj['id'], 'type' => $obj['type']));
		$meta= dRead::single($q);
		if(is_numeric($meta)){
  		return $meta;
		}
		$out= array();
		$out['post']= $obj;
		$out['meta']= $meta;
		$out['user']= oUser::get(array('id' => $obj['user_id']));
		$out['stats']= oPost::stats($obj['id']);
		$out['address']= oAddress::get(array('user_id' => $obj['user_id']));	  
		return $out;
	}
	
	# TOTAL 
	public static function total($params){
    $q= qPost::total($params);		
		$total= dRead::single($q);
		$out['total']= $total['COUNT(*)']; 
		return $out;
	}
			
	# STATS
	public static function stats($post_id){
	  $out= array();
    $result= new uResult();
    
    $q= qTotal::comments(array('post_id' => $post_id));
  	$comments= $result->r_single($q);
  	
  	$q= qTotal::thumbs(array('post_id' => $post_id));
  	$thumbs= $result->r_single($q);
  	
  	$q= qTotal::views(array('post_id' => $post_id));
  	$views= $result->r_single($q);
  	
  	$out['comments']= $comments['total'];
  	$out['thumbs']= $thumbs['total'];
  	$out['positive']= $thumbs['positive'];
  	$out['popularity']= 0;
  	if($thumbs['total'] > 1){
  	 $out['popularity']= (int) ($thumbs['positive']/$thumbs['total']*100);
  	}
  	$out['views']= $views['total']; 	
  	return $out;
	}
}

?>