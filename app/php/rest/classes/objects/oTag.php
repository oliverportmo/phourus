<?php

class oTag
{	
	
	# GET
	public function get($params){
		$out= dRead::tag($params);
		return $out;
	}

	# POST
	public function create($model){
		$out= dCreate::create($model, 'tags');	
		return $out;
	}
	
	# PUT
	
	# DELETE
	public function delete($id){
		$out= dDelete::delete($id, 'tag');
		return $out;
	}	
}

?>