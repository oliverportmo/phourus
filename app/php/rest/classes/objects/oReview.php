<?php

class oReview
{	
	
	# GET
	public function get($params){
		$out= dRead::reviews($params);
		return $out;
	}

	# POST
	public function create($model){
  	$out= dCreate::create($model, 'reviews');	
		return $out;
	}
	
	# PUT
	public function update($id, $model){
  	$out= dUpdate::update($id, 'review', $model);
		return $out;
	}
	
	# DELETE
	public function delete($id){
		$out= dDelete::delete($id, 'reviews');
		return $out;
	}	
}

?>