<?php

class qAuth {
  
  # login
	public static function login($params){			
  	// @key not good!
		return sprintf("SELECT id FROM `%s` WHERE %s = '%s';", TABLE_USERS, $params['key'], $params['username']);
	}
	
	# hash
	public static function hash($user_id){			
		return sprintf("SELECT hash FROM `%s` WHERE user_id = %d;", TABLE_PASSWORDS, $user_id);
	}
	
	# session get
	public static function session($params){		
		return sprintf("SELECT * FROM `%s` WHERE id = '%s' AND user_id = %d;", TABLE_TOKENS, $params['id'], $params['user_id']);
	}
	
	# session auth
	public static function session_auth($params){
  	return sprintf("SELECT user_id FROM `%s` WHERE id = %d AND user_id = %d AND expires >= NOW();", TABLE_TOKENS, $params['id'], $params['user_id']);
	}
	
	# session create
	public static function session_create($params){	
		return sprintf("INSERT INTO `%s` (`id`, `expires`, `user_id`) VALUES ('%s', '%s', %d);", TABLE_TOKENS, $params['id'], $params['expires'], $params['user_id']);
	}	
}

?>