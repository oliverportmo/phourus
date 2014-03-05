<?php

class oClout
{	
	
	# GET
	public function get($params){
	  $q= qOrg::clout($params);
  	return isset($params['id']) ? dRead::single($q) : dRead::collection($q);
	}

	# POST
	public function create($model){
		$out= dCreate::create($model, 'clout');	
		return $out;
	}
	
	# PUT
	public function update($id, $model){
		$out= dUpdate::update($id, 'clout', $model);
		return $out;
	}
	
	# DELETE
	public function delete($id){
		$out= dDelete::delete($id, 'clout');
		return $out;
	}	
}

?>