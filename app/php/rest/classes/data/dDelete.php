<?php

class dDelete {
  		
	public static function delete($id, $type){
  	$q= qBase::delete($id, $type);
    $result= new uResult();
    $out= $result->r_delete($q);
    return $out;	
	}	
}

?>