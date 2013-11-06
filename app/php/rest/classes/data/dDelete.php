<?php

class dDelete {
  	
	public function post($id){
		return self::delete($id, 'posts');
	}
	
	public static function delete($id, $type){
  	$q= uQueries::delete($id, $type);
    $result= new uResult();
    $out= $result->r_delete($q);
    return $out;	
	}
		
	public function session($token){
  	return $token;
	}
	
}

?>