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
		$authorized= dRead::login($params['username'], $params['password']);

		if($authorized != false){
			return dCreate::session($authorized['id']);
		}
		return false;
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