<?php

class oView
{	
	
	# GET
	public function get($params){
		$q= qSocial::views($params);
  	return isset($params['id']) ? dRead::single($q) : dRead::collection($q);
	}
	
	# POST
	public function create($model){
  	$out= dCreate::create($model, 'views');	
		return $out;
	}
	
	# PUT
	public function update($id, $model){
  	$out= dUpdate::update($id, 'view', $model);
  	return $out;
	}
	
	# DELETE
	public function delete($id){
		$out= dDelete::delete($id, 'view');
		return $out;
	}	
}

?>