<?php

class oCommunity
{	
	
	# GET
	public function get($params){
		$ids= dRead::community($params);
		if(is_numeric($ids)){
  		return $ids;
		}
		foreach($ids as $i){	
			$out[]= oUser::get(array('id' => $i['id']));
		}
		return $out;
	}	
}

?>