<?php

class oComment
{	
	
	# GET
	public function get($params){
	  $q= qSocial::comments($params);
	  if(isset($params['id'])){
  	  $comment= dRead::single($q);
  	  return self::full($comment);
	  }else{
  	  $comments= dRead::collection($q);
  	  if(is_numeric($comments)){
    	  return $comments;
  	  }
  	  $out= array();
  	  foreach($comments as $comment){
  	    $out[]= oComment::get(array('id' => $comment['id']));
  	  }
	  }	
		return $out;
	}
	
	# POST 
	public function create($model){
		$out= dCreate::create($model, 'comment');	
		return $out;
	}
	
	# PUT
	public function update($id, $model){
		$out= dUpdate::update($id, 'comment', $model);
		return $out;
	}
	
	# DELETE
	public function delete($id){
		$out= dDelete::delete($id, 'comment');
		return $out;
	}
	
	# FULL
	private function full($obj){
    if(is_numeric($obj)){
  	  return $obj;
	  }
	  $out= array();
	  $out['comment']= $obj;
	  $out['user']= oUser::get(array('id' => $obj['user_id']));
	  //$out['post']= oPost::get(array('id' => $obj['post_id']));
	  return $out;
	}	
}

?>