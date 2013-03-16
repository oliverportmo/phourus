<?php


class apiDelete {
	
	var $_id;	
	var $_type;
	
	public function __construct($id, $type){
		$this->_id= $id;
		$this->_type= $type;
	}
	
	private function id(){
		return $_id;
	}
	
	private function table(){
		return table($_type);
	}
		
	public function result($q){
		//single, profile
		$query= $Q[$q];
		$params= get_object_vars($this);
		$query->execute($params);
		return $out;
	}
}
	
?>	