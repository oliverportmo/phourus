<?php

class oInfluence
{	
	
	# GET
	public function get($params){
		$out= dRead::influence($params);	
		return $out;
	}

	# POST
	public function create($params){
		$stats= oStats::stats($params);
		$out= self::calculate($stats);
		return $out;
	}
	
	# PUT
	public function update($params){
	  $stats= oStats::stats($params);
	  $influence= self::calculate($stats);
  	$out= dUpdate::influence($params, $influence);
		return $out;
	}
	
	# DELETE
	public function delete($id){
		$out= dDelete::influence($id); 
		return $out;
	}	

	// calculate
	public function calculate($stats){
  	extract($stats);
  	if(isset($post_id)){
      return 30;
      // comments, views, thumbs, positive, post age, user influence
  	}
  	if(isset($user_id)){
  	   // comments, views, thumbs, positive, posts, followers total/avg follower, registered
    	 return 40;
  	}
    if(isset($org_id)){
      return 50;
    }
    return false;
	}
}

?>