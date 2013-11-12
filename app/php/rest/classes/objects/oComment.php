<?php

class oComment
{	
	
	# GET
	public function get($params){
	  if(isset($params['id'])){
  	  $out= array();
  	  $out['comment']= dRead::comments($params);
  	  if(is_numeric($out['comment'])){
    	  return $out['comment'];
  	  }
  	  $out['user']= oUser::get(array('id' => $out['comment']['user_id']));
  	  //$out['post']= oPost::get(array('id' => $out['comment']['post_id']));
	  }else{
  	  $comments= dRead::comments($params);
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
}

?>