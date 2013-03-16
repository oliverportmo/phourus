<?php

class apiRead {
	
	var $_type; 
	var $_page; 
	var $_limit; 
	var $_advanced; 
	var $_sort; 
	var $_asc; 
	
	public function __construct($model){
		$this->_id= $model['id'];
		$this->_type= $model['type'];
		$this->_page= $model['page'];
		$this->_limit= $mode['limit'];
		$this->_trash= $mode['trash'];
		$this->_advanced= $model['advanced'];
		$this->_sort= $model['sort'];
		$this->_asc= $model['asc'];
		$this->_unique= $model['unique'];
		$this->_mode= $model['mode'];
	}
	
	public function result($q){
		//stream, merge, login, profile, single, total, unique
		$query= '';
		global $Q;
		switch($q)
		{
			case 'stream':
				/*$this->_type= 'stream';
				if($this->_mode=== 'current')
				{
					$this->_advanced= ['user', 'EQUALS', 'USE-120403-001-A', ''];
				}  
				if($this->_mode=== 'me')
				{
					$this->_advanced= ['user', 'EQUALS', 'USE-120403-002-A', ''];
				} */
				$params= array();
				//$params[':user']= "USE-120403-001-A";
				//$params['table']= 'app_stream';
				//$params['table']= 'app_stream';
				$params['trash']= $this->trash();
				//$params['hard']= '';
				//$params['sort']= '';
				//$params['paging']= '';
				//$query=
			break;
			case 'merge':
			break;
			case 'profile':
			break;
			case 'single':
			break;
			case 'total':
			break;
			case 'unique':
			break;
		}
		global $db;
		$query= $db->prepare($Q['load']);

		//$params= get_object_vars($this);
		if($query->execute($params)){
			$query->setFetchMode(PDO::FETCH_ASSOC); 
			$out= array(); 
			while($row= $query->fetch()){
			     $out[]= $row;
			}
			return $out;
		}else{
			return $query->errorInfo();
		}	
	}
	
	private function selector(){
		$selector= '*';
		if($this->unique != NULL && $this->unique != '')
		{
			$selector= 'DISTINCT('.$this->unique.')';	
		}
		return $selector;
	}	
	
	private function table(){
		return table($this->_type);
	}
	
	private function trash(){
		$out= 'WHERE `privacy` != -1 ';
		if($this->_trash== true)
		{
			$out= 'WHERE `privacy` = -1 ';
		}
		return $out;
	}		
		
	private function order(){
		if($this->_sort== null)
		{
			return '';
		}
		$direction= 'DESC';
		if($this->_asc== true)
		{
			$direction= 'ASC';	
		}
		return "ORDER BY ".$order." ".$direction;
	}	
	
	//Paging
	private function paging(){
		//?????
		//$offset= $limit*$page;
		
		//If no 'page' param is set, omit paging altogether
		if($this->page== null)
		{
			return '';	
		}
		
		//Set default limit
		if($this->limit== null || $this->limit < 1)
		{
			$this->limit= 20;
		}
		
		return "LIMIT ".$offset.",".$limit;	 
	}
	
	private function advanced(){
		$input= $this->_advanced;
		if(!is_array($input))
		{
			return '';	
		}
		$end= end($input);
		foreach($input as $row)
		{
			$field= $row[0];
			$operator= $row[1];
			$value= mysql_real_escape_string($row[2]);
			$logic= $row[3];
			switch($operator)
			{
				case 'EQUALS':
					$operator= '=';
				break;
				case 'NOT EQUALS':
					$operator= '!=';
				break;
				case 'LIKE':
					$operator= 'LIKE';
				break;
				case 'CONTAINS':
					$operator= 'IN';
				break;
				case 'GREATER THAN':
					$operator= '<';
				break;
				case 'LESS THAN':
					$operator= '>';
				break;
				case 'GREATER THAN EQUAL':
					$operator= '>=';
				break;
				case 'LESS THAN EQUAL':
					$operator= '<=';
				break;
				default:
					continue;
				break;
			}
			if($end== $row)
			{
				$logic= '';	
			}
			if($value== 'null')
			{
				$operator= 'IS';
				$value= 'NULL';
			}
			if($value != '')
			{
				$out.= sprintf('`%s` %s "%s" %s', $field, $operator, $value, $logic);
			}
		}
		return 'AND '.$out;	
	}	
}

?>
