<?php

class uQuery 
{
  
  // When	
	public static function when($params){
  	return '';
  	$out= '';
  	if(isset($params['date_start'])){
      $out.= sprintf("%s.created > %s", TABLE_POSTS, $params['date_start']); 
  	} 
  	if(isset($params['date_end'])){
      $out.= sprintf("%s.created < %s", TABLE_POSTS, $params['date_end']);	
  	}
  	return $out;
	}	
	
  //Paging
	public static function paging($params){	
		$page = isset($params['page']) && $params['page'] > 1 ? $params['page'] : 0;
		$limit = isset($params['limit']) ? $params['limit'] : 20;
		$offset= $page * $limit;
		return sprintf("LIMIT %d, %d", $offset, $limit);	 
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