<?php

class oCommunity
{	
	
	# GET
	public function get($params){
		$out= dRead::community($params);
		return $out;
	}	
}

?>