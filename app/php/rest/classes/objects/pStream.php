<?php 

class pStream
{	
	public function get($params){
		$read= new apiRead();
		$out= $read->stream($params);
		return $out;
	}
	
	/** PARAMS **/
	//Rest of class used to create params object
	static public function params($params){
		//types, page, limit, field, asc, mode, date
		extract($params);
		
		$params= array();
		$params['privacy']= self::privacy();
		$params['types']= self::types($types);
		$params['order']= self::order($field, $asc);
		$params['paging']= self::paging($page, $limit);
		$params['mode']= self::mode($mode);
		//$params['when']= $this->when();
		return $params;
	}
	
	/** PRIVATE **/
	private function privacy($privacy= false){
		$out= "WHERE `privacy` != -1 ";
		if($privacy== true)
		{
			$out= "WHERE `privacy` = -1 ";
		}
		return $out;
	}		
	
	private function types($types){
		$formatted= str_replace(";", "','",  $types);
		$string= "'$formatted'";
		return "AND type IN($string) ";
	}
		
	private function order(){
		if($sort== null)
		{
			return '';
		}
		$direction= 'DESC';
		if($this->_asc== true)
		{
			$direction= 'ASC';	
		}
		return "ORDER BY ".$this->_sort." ".$direction;
	}	
	
	//Paging
	private function paging($page, $limit= 10){
		//?????
		//$offset= $limit*$page;
		
		//If no 'page' param is set, omit paging altogether
		if($page== null)
		{
			return '';	
		}
		
		//Set default limit
		if($limit== null || $limit < 1)
		{
			$limit= 20;
		}
		
		return "LIMIT ".$page.",".$limit;	 
	}
	
	private function mode($mode){
		if($mode== 'me'){
			/** MUST PASS TOKENIZED USER **/
			$out= self::advanced(array('user_id', 'EQUALS', 'USE-120403-002-A', ''));	
		}else if($mode== 'current'){
			/** MUST PASS LAST USER FROM UI **/
			$out= self::advanced(array('user_id', 'EQUALS', 'USE-120403-001-A', ''));
		}else if($mode== 'phourus'){
			$out= '';
		}else if($mode== 'friends'){
			$out= '';
		}else if($mode== 'following'){
			$out= '';
		}else if($mode== 'followers'){
			$out= '';
		}
		return $out;
	}
	
	/** GENERIC **/
	private function selector(){
		$selector= '*';
		if($unique != NULL && $unique != '')
		{
			$selector= 'DISTINCT('.$unique.')';	
		}
		return $selector;
	}
	
	private function advanced($input){
		if(!is_array($input))
		{
			return '';	
		}
		if(!is_array($input[0])){
			$input= array($input);
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
				$out.= sprintf("`%s` %s '%s' %s", $field, $operator, $value, $logic);
			}
		}
		return 'AND '.$out;	
	}	

}

?>