
<?php

class oSession
{

  # GET	
	public function get($headers){
		$params= array();
		$params['id']= $headers['X_API_KEY'];
		$params['user_id']= $headers['FROM'];				
		$q= qAuth::session($params);
		$out= dRead::single($q);
		$out['user']= oUser::get(array('id' => $out['user_id']));
		return $out;	
	}
	
	# POST
	public function create($headers){
    $params= uUtilities::decode($headers['AUTHENTICATION']); 
		$user= self::login($params['username']);
		if(!$user){
  	  return 403;		
    }		
    $user_id = $user['id'];
		$hash= self::hash($user_id);
		if(is_numeric($hash)){
  		return 403;
		}
		$check= validate_password($params['password'], $hash['hash']);
		if($check === true){	
  		return dCreate::session($user_id);
		}
		return 503;				
	}
	
	# PUT
	// Not necessary
	
	# DELETE
	public function delete($token){
		//$out= dDelete::session($id);
		return $token;
	}	
	
	# OTHER
	public function auth($headers){
  	$id= $headers['X_API_KEY'];
  	$user_id= $headers['FROM'];
  	$q= qAuth::session_auth(array('id' => $id, 'user_id' => $user_id));
  	$result= new uResult();
  	$out= $result->r_single($q);
  	if(count($out)== 1 && isset($out['user_id']) && $out['user_id'] != null){
    	return $out['user_id'];
  	}else{
    	return false;
  	}
	}
	
	# LOGIN
	public static function login($user, $key = 'email'){
		$params= array();
		$params['username']= $user;
		$params['key']= $key;
		$q= qAuth::login($params);
		return dRead::single($q);
	}
	
	# HASH
	public static function hash($user_id){
		$q= qAuth::hash($user_id);
		return dRead::single($q);
	}
}

?>