<?php

class oComment
{	
	
	# GET
	public function get($params){
		$out= dRead::comments($params);
		return $out;
	}
	
	# POST 
	public function create($model){
		$out= dCreate::create($model, 'comments');	
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