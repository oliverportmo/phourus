<?php

class uResult
{

	public function __construct(){
		$DEV_DB_NAME= 'phourus:dev';
		$DEV_DB_USER= 'developer';
		$DEV_DB_PASS= 'phourus';
		
		//global $db;
		try {  
			$this->db= new PDO("mysql:host=127.0.0.1;port=8889;dbname=$DEV_DB_NAME;", $DEV_DB_USER, $DEV_DB_PASS);  
		}  
		catch(PDOException $e) {  
		    // out() not available here
		    //out($e->getMessage());  
		}
	}	
	
	public function db(){
		return $this->db;
	}
	
	/** ACTIONS **/
	public function r_read($q, $trans= false){
		$out= self::result($q, 'read', $trans);
		return $out;
	}
	
	public function r_single($q, $trans= false){
		$out= self::result($q, 'single', $trans);
		return $out;
	}
	
	public function r_create($q, $trans= false){
		$out= self::result($q, 'create', $trans);
		return $out;
	}
	
	public function r_update($q, $trans= false){
		$out= self::result($q, 'update', $trans);
		return $out;
	}
	
	public function r_delete($q, $trans= false){
  	$out= self::result($q, 'delete', $trans);
  	return $out;
	}
	
	public function r_login($q, $trans= false){	
		$out= self::result($q, 'login', $trans);
		return $out;
	}
	
	/** PRIVATE **/
	private function result($q, $mode, $trans){
  	// mode: read (default), create, single, update, delete
  	if($trans== true){
    	return self::transaction($q, $mode);
  	}else{
    	return self::standard($q, $mode);
  	}
	}
	
	private function transaction($q, $mode){
  	$id= 0;
    $this->db->beginTransaction();
    $out= $this->db->exec($q);
    $this->db->commit();
  	  
    if($out== false){
      $this->db->rollBack();
      return false;
    }
    return $out;
  }
  
  private function standard($q, $mode){
	  $query= $this->db->prepare($q);
  	$query->execute(array());
  	if(!$query){
    	return false;
  	}
  	$query->setFetchMode(PDO::FETCH_ASSOC);
  	
  	$out= array();
  	switch($mode){
      case 'single':
        $out= $query->fetch();
      break;
      case 'create':
        $out= $this->db->lastInsertId();
        // return current and id?
      break;
      case 'update':
        // Return original & current?
        $out= true;
        //$out= $query->fetch();
      break;
      case 'delete':
        // Return original
      break;
      case 'login':
        while($row= $query->fetch()){
  		    $out[]= $row;
  			}
  			if(count($out)== 1){
  				return $out[0];	
  			}else{	
  				return false;
  			}	
      break;
      default:
        while($row= $query->fetch()){
    		  $out[]= $row;
    		} 
      break;
    } 
    return $out;
  }
}

/** 
		if($query){		
			//$id= $this->db->lastInsertId();
			//$id= $query->setFetchMode(PDO::FETCH_ASSOC);
			
			/* RETURN NEW MODEL??		
			$last->execute($id);
			$last->setFetchMode(PDO::FETCH_ASSOC); 
			$out= $row= $last->fetch();
			return $out;

		}else{
			return false;
		}		
		if($query){		
			//$out= $query->setFetchMode(PDO::FETCH_ASSOC); 			
			//$out= $query->fetch();
			return $query;
		}else{
		  return false;
		  //debug
			$out= array();
			$out['error']= true;
			$out['data']= $query->errorInfo();
			return $out;
		}
if($query){		
			$query->setFetchMode(PDO::FETCH_ASSOC); 			
			$out= array(); 
			while($row= $query->fetch()){
			     $out[]= $row;
			}
		  return $out;
		}else{
		  return false;
		  //debug
			$out= array();
			$out['error']= true;
			$out['data']= $query->errorInfo();
			return $out;
		
		}
				if($query){		
			//$id= $this->db->lastInsertId();
			//return $id;
			//$last->execute($id);
			//$last->setFetchMode(PDO::FETCH_ASSOC); 
			//$out= $row= $last->fetch();
			//return $out;
		}else{
			return false;
		}	**/
?>