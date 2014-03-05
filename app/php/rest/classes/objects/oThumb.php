<?php

class oThumb
{	
	
	# GET
	public function get($params){
	  $q= qSocial::thumbs($params);
  	return isset($params['id']) ? dRead::single($q) : dRead::collection($q);
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