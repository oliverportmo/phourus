<?php
ini_set('display_errors', 1);

class oStats
{	

	# GET
	public function stats($params){
		extract($params);
		
		if(isset($post_id)){
      return self::post($post_id);
    }		
		if(isset($user_id)){
  		return self::user($user_id);
		}
    if(isset($org_id)){
  		return self::org($org_id);
		}
	}		

	# PRIVATE
	static function post($post_id){
  	$out= dRead::stats_post($post_id);
		return $out;
	}
	
	static function user($user_id){
	  $out= dRead::stats_user($user_id);	  
		return $out;
	}
	
	static function org($org_id){
	  $out= dRead::stats_org($org_id);
  	return $out;
	}
}

?>