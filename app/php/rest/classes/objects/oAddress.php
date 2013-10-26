<?php

class oAddress
{	
	
	# GET
	public function get($params){
		$out= dRead::address($params);
		return $out;
	}

	# POST
	public function create($model){
		$out= dCreate::create($model, 'address');	
		return $out;
	}
	
	# PUT
	public function update($id, $model){
		$out= dUpdate::update($id, 'address', $model);
		return $out;
	}
	
	# DELETE
	public function delete($id){
		$out= dDelete::delete($id, 'address');
		return $out;
	}	
}

?>