<?php

class pSession
{
	var $token= '1235fgqw4tf3';
	
	public function create($user, $pass, $key= 'email'){
		$read= new apiRead();
		$out= $read->login($user, $pass, $key);
		
		if($authorized){
			$out['session']= self::session($id);
			return $out;
		}
		return false;
	}
	
	public function get($auth){
		$params= decode($auth);
		$read= new apiRead();
		$out= $read->session($params['token'], $params['user']);
		return $out;	
	}	
	
	/** PRIVATE **/
	private function session($id){
		$create= new apiCreate();
		$out= $create->session($id);
		return $out;
	}
}

?>