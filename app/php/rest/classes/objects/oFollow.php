<?php

class oFollow
{	
	
	# GET
	public function get($params){
		$out= dRead::follows($params);
		return $out;
	}

	# POST
	public function create($model){
		$out= dCreate::create($model, 'follows');	
		return $out;
	}
	
	# PUT
	public function update($id, $model){
  	$out= dUpdate::update($id, 'follow', $model);
		return $out;
	}
	
	# DELETE
	public function delete($id){
		$out= dDelete::delete($id, 'follow');
		return $out;
	}	
}

?>