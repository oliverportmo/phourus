<?php

class oSession
{

  # GET	
	public function get($headers){
		$token= $headers['X_API_KEY'];
		$user_id= $headers['FROM'];
		$out= dRead::session($token, $user_id);
		return $out;	
	}
	
	# POST
	public function create($headers){
    $params= uUtilities::decode($headers['AUTHENTICATION']); 
		$user= dRead::login($params['username']);
		if(!$user){
  	  return 403;		
    }		
    $user_id = $user['id'];
		$hash= dRead::hash($user_id);
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
  	$q= uQueries::session_auth(array('id' => $id, 'user_id' => $user_id));
  	$result= new uResult();
  	$out= $result->r_single($q);
  	if(count($out)== 1 && isset($out['user_id']) && $out['user_id'] != null){
    	return $out['user_id'];
  	}else{
    	return false;
  	}
	}
}

?>