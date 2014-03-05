<?php

class dRead {
	
	public static function single($q){
  	if($q === false){ return 400; }
  	$result= new uResult();
  	return $result->r_single($q);
	}
	
	public static function collection($q){
  	if($q === false){ return 400; }
  	$result= new uResult();
  	return $result->r_read($q); 	
	}
}

?>