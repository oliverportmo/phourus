<?php

class oThumb
{	
	
	# GET
	public function get($params){
		$out= dRead::thumbs($params);
		return $out;
	}

	# POST
	public function create($model){
  	$out= dCreate::create($model, 'thumbs');	
		return $out;
	}
	
	# PUT
	public function update($id, $model){
  	$out= dUpdate::update($id, 'thumb', $model);
		return $out;
	}
	
	# DELETE
	public function delete($id){
		$out= dDelete::delete($id, 'thumb');
		return $out;
	}	
}

?>