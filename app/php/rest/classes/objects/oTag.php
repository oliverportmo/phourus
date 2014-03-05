<?php

class oTag
{	
	
	# GET
	public function get($params){
		$q= qPost::tag($params);
  	return isset($params['id']) ? dRead::single($q) : dRead::collection($q);
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