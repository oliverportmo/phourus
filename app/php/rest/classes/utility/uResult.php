<?php

class uResult
{

	public function __construct(){
		$DEV_DB_NAME= 'phourus:dev';
		$DEV_DB_USER= 'developer';
		$DEV_DB_PASS= 'phourus';
		
		// empty
		if(0){
  		$DEV_DB_NAME= 'phourus:empty'; 		
  		$DEV_DB_USER= 'empty';
  	}	
		
		//global $db;
		try {  
			$this->db= new PDO("mysql:host=localhost;port=3706;dbname=$DEV_DB_NAME;", $DEV_DB_USER, $DEV_DB_PASS);  
			$this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$this->db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
		}  
		catch(PDOException $e) {  
		    // out() not available here
		    var_dump($e->getMessage());  
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
	
	private function transaction($queries, $mode){
  	/*$id= 0;
    
    $out= $this->db->exec($q);
    $this->db->commit();
  	  
    if($out== false){
      $this->db->rollBack();
      return false;
    }
    */
    $this->db->beginTransaction();
    foreach($queries as $q){
      /*try {
        $p= $this->db->prepare($q);
      }catch (Exception $e){
        return 503;
      }
      $this->db->exec($q);
      $p->setFetchMode(PDO::FETCH_ASSOC);
      try {
        $r= $p->fetch();
      }catch (Exception $e){
        $r= $e;
      }  
      $out[]= $r;*/
      try {
        $r= $this->db->exec($q);
        $out[]= $r;
        $id = $this->db->lastInsertId();
        if(is_numeric($id) && $id > 0){
          $out['id'] = $id; 
        } 
      }catch (Exception $e){
        $this->db->rollBack();
        return false;
      }
  	}
  	$this->db->commit();
    return $out;
  }
  
  private function standard($q, $mode){
	  
  	try {
    	$query= $this->db->prepare($q);
  	}catch(Exception $e){
  	  //var_dump($e);
    	return 503;
  	}
  	$query->execute(array());
  	$query->setFetchMode(PDO::FETCH_ASSOC);
  	
  	$out= array();
  	switch($mode){
      case 'single':
        $out= $query->fetch();
        if($out== false){
          $out= 404;
        }
      break;
      case 'create':
        $out= $this->db->lastInsertId();
        if($out== null){
          $out= 500; 
        }
        // return current and id?
      break;
      case 'update':
        // Return original & current?
        $out= true;
        //$out= $query->fetch();
      break;
      case 'delete':
        $out= true;
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
    		if(count($out) < 1){
      		$out= 404;
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