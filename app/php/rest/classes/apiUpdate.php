<?php

class apiUpdate {
	
	var $_id;	
	var $_model;
	
	public function __construct($id, $model){
		
		$data= $model;
		if(!isset($data['record'])){
			$data['record']= '';
		}
		$i= 0;
		$keys= '';
		$values= '';
		$type= $model['type'];
		foreach($data as $key => $value)
		{	
			if($i != 0)
			{
				$keys.= ', ';
				$values.= ', ';
			}
			$pairs= $this->pairs($key, $value, array('type' => $type));
			$keys.= '`'.$pairs['key'].'`';
			$values.= $pairs['value'];
			$i++;
		}	
		$this->_keys= str_replace('(, ', '', $keys);
		$this->_values= str_replace('(, ', '', $values);
	}
		
	public function result($q){
		$output= array();
		$output['input']= $args;
		
		//type, data
		extract($args);
	
		$table= $type;
		/** ===== 'edit' Query ===== **/
		$query= 'UPDATE '.table($table).' SET ';
		$record= mysql_real_escape_string($data['record']);
		unset($data['record']);
		foreach($data as $key => $value)
		{
			$pairs= process_pairs($key, $value, array('type' => $type));
			//MUST OMIT CREATED FIELD ON UPDATES
			if($pairs['key'] != 'created')
			{
				$query.= $pairs['key']."=".$pairs['value'].", ";
			}
		}
		
		$query.= 'WHERE record = "'.$record.'";';
		$query= str_replace(', WHERE', ' WHERE', $query);
		$result= @mysql_query($query);
		if(!$result)
		{
			$output['data']= 'Data could not be updated.';
			$output['debug']= $query;
			$output['error']= 1;	
			return $output;
		}
		
		$output['data']= 'Data updated successfully.';
		$output['error']= 0;
		$output['debug']= $query;
		return $output;
		
		//single, profile
		$query= $Q[$q];
		$query->execute($this->_data);
		
		$id= $db->lastInsertId();
		$last= $Q[$q];
		$last->execute($id);
		$last->setFetchMode(PDO::FETCH_ASSOC); 
		$out= $row= $last->fetch();
		return $out;
	}
}
	
?>	