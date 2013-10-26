<?php

class dDelete {
	
	# POST
	public static function post($id){
		
	}
	
	// user, org, view, thumb, comment, follow, clout, review, address, tag
	public static function delete($id, $type){
  	$q= uQueries::delete($id, $type);
    $result= new uResult();
    $out= $result->r_delete($q);
    return $out;	
	}
		
	# SESSION
	public static function session($token){

	}
}
	
?>	