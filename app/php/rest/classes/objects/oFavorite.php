<?php

class oFavorite
{	
	
	# GET
	public function get($params){
	  $q= qSocial::favorites($params);
  	return isset($params['id']) ? dRead::single($q) : dRead::collection($q);
	}

	# POST
	public function create($model){
		$out= dCreate::create($model, 'favorite');	
		return $out;
	}
	
	# PUT
	public function update($id, $model){
  	$out= dUpdate::update($id, 'favorite', $model);
		return $out;
	}
	
	# DELETE
	public function delete($id){
		$out= dDelete::delete($id, 'favorite');
		return $out;
	}	
}

?>