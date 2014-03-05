<?php

class oReview
{	
	
	# GET
	public function get($params){
		$q= qOrg::reviews($params);
		if(isset($params['id'])){
  	  $review= dRead::single($q);
  	  return self::full($review);

	  }else{
  	  $reviews= dRead::collection($q);
  	  if(is_numeric($reviews)){
    	  return $reviews;
  	  }
  	  $out= array();
  	  foreach($reviews as $review){
  	    $out[]= oReview::get(array('id' => $review['id']));
  	  }
	  }	
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
	
	# FULL
	private function full($obj){
  	if(is_numeric($obj)){
  	  return $obj;
	  }
	  $out= array();
	  $out['review']= $obj;
	  $out['user']= oUser::get(array('id' => $obj['user_id']));
	  return $out;
	}
}

?>