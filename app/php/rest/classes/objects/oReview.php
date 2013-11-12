<?php

class oReview
{	
	
	# GET
	public function get($params){
		if(isset($params['id'])){
  	  $out= array();
  	  $out['review']= dRead::reviews($params);
  	  if(is_numeric($out['review'])){
    	  return $out['review'];
  	  }
  	  $out['user']= oUser::get(array('id' => $out['review']['user_id']));
	  }else{
  	  $reviews= dRead::reviews($params);
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
}

?>