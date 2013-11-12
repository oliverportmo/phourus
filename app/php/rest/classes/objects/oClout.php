<?php

class oClout
{	
	
	# GET
	public function get($params){
    $out= dRead::clout($params);
  	return $out;
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