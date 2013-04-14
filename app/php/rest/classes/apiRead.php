<?php

class apiRead {
	
	/** USER **/
	public function user($id){
		$params['id']= $id;
		$query= new apiQueries($params);
		$php= trim($query->user);	
		$out= $this->result($php);
		return $out;
	}
	
	/** STREAM **/
	public function stream($params){
		$params= pStream::params($params);
		$query= new apiQueries($params);
		$php= trim($query->stream);	
		$stream= $this->result($php);
		$single= new pSingle();
		foreach($stream as $i){	
			$out[]= $single->get($i['stream_id']);
		}
		return $out;
	}
		
	/** SINGLE **/
	public function meta($id){
		$params['id']= $id;
		$query= new apiQueries($params);
		$php= trim($query->meta);
		$out= $this->result($php);
		return $out;
	}
	
	public function post($id, $type){
		$params['id']= $id;
		$params['table']= table($type);
		$query= new apiQueries($params);
		$php= trim($query->post);
		$out= $this->result($php);
		return $out;
	}
	
	/** LOGIN **/
	public function login($user, $pass, $key= 'email'){
		$params['user']= $user;
		$params['pass']= $pass;
		$params['key']= $key;
		$query= new apiQueries($params);
		$php= trim($query->login);	
		$out= $this->result($php);
		return $out;
	}
	
	/** SESSION **/
	public function session($token, $user){
		$params['token']= $token;
		$params['user']= $user;
		$query= new apiQueries($params);
		$php= trim($query->session);	
		$out= $this->result($php);
		return $out;
	}
	
	//Output	
	private function result($php){
		global $db;
		$query= $db->prepare($php);

		if($query->execute($params)){
			$query->setFetchMode(PDO::FETCH_ASSOC); 
			$out= array(); 
			while($row= $query->fetch()){
			     $out[]= $row;
			}
			if(count($out)== 1){
				return $out[0];	
			}else{
				return $out;
			}	
		}else{
			return $query->errorInfo();
		}	
	}
	
	/**
	
	
	public function meta($single){
		$out= array();
		if(is_array($single)){
			$this->_id= $single['id'];
			$this->_type= 'stream';
			$meta= $this->result('meta');
			$out= array_merge((array)$meta, (array)$post);
		}else{
			return $single;
		}
	}
	
	public function merge($posts){
		$out= array();
		foreach($posts as $post){
			$this->_id= $post['id'];
			$this->_type= $post['type'];
			$merged= $this->result('single');
			$out[]= array_merge($merged[0], (array)$post);
		}
		return $out;
	}
	**/
}

?>
