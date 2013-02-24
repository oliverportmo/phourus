<?php

class phourus_data
{
	function register($args)
	{
		$add= array();
		$add['type']= 'users';
		$add['data']= $args;
		$data= $this->add($add);
		return $data;
	}
	
	function login($args)
	{
	
		//email, password
		extract($args);
		
		$query= "SELECT * FROM ".$this->table('users')." WHERE `email` = '".$email."' AND `password` = '".$password."';";
		
		$result= @mysql_query($query);
		if(!$result)
		{
			$output['data']= 'Could not login';
			$output['debug']= $query.'<br />'.mysql_error();
			$output['error']= 1;
			return $output;
		}
		$rows= @mysql_num_rows($result);
		if($rows < 1){
			$output['data']= 'Username/password incorrect.';
			$output['debug']= $query.'<br />'.mysql_error();
			$output['error']= 1;
			return $output;
		}
		
		$user= @mysql_fetch_assoc($result);
		if(!$user){
			$output['data']= 'There was an error loading your account.';
			$output['debug']= $query.'<br />'.mysql_error();
			$output['error']= 1;
			return $output;
		}
		unset($user['password']);
		$token= $this->token();
		if(!$token){
			//return $token;
		}
		$token= $token['data'];
		$user['token']= $token['token'];
		$user['expires']= $token['expires'];
		
		
		$output['data']= $user;
		$output['debug']= $query;
		$output['error']= 0;
		return $output;
	}
	
	function token(){
		date_default_timezone_set('UTC');
		$expires = date( 'Y-m-d H:i:s', strtotime('+60 Minutes'));
		
		$token['expires']= $expires;
		$token['token']= '1235fgqw4tf3';
		
		$output['data']= $token;
		$output['debug']= $token;
		$output['error']= 0;
		return $output;
	}
	
	function table($type)
	{
		$tables= array();
		$tables['stream']= 'app_stream';
		$tables['blogs']= 'core_blogs';
		$tables['ideas']= 'core_ideas';
		$tables['links']= 'core_links';
		$tables['events']= 'core_events';
		
		$tables['matters']= 'voice_matters';
		
		$tables['subjects']= 'mind_subjects';
		$tables['questions']= 'mind_questions';
		$tables['answers']= 'mind_answers';
		
		$tables['debates']= 'voice_debates';
		$tables['bills']= 'voice_bills';
		$tables['votes']= 'voice_votes';
		
		$tables['beliefs']= 'faith_beliefs';
		$tables['timeline']= 'faith_timeline';	
		
		$tables['users']= 'app_users';	
		return $tables[$type];
	}
	
	//Stream 
	function stream($args)
	{
		$output= array();
		$output['input']= $args;
		
		//sort, direction, type, page, limit, types, mode
		//order, database, hard
		$query['type']= 'stream';
		$query['order']= $args['sort'];
		$query['direction']= $args['direction'];
		$query['page']= $args['page'];
		$query['limit']= $args['limit'];
		
		$mode= '';
		if($args['mode']== 'me'){
			$mode= 'AND user = "USE-120403-001-A"';	
		}else if($args['mode']== 'current'){
			$mode= 'AND user = "USE-120505-001-A"';
		}
		$in= "AND `type` IN(".$this->process_types($args['types']).")";
		$query['hard']= $mode.' '.$in;
		 
		
		$stream= array();
		$stream= $this->select($query);
		if($stream['error']== 1)
		{
			$output['data']= 'There was an error loading stream.';
			$output['debug']= $stream['debug'];
			$output['error']= 1;
			return $output;
		}
		
		$data= $this->merge($stream['data']);
		
		$output['data']= $data;
		$output['debug']= $stream;
		$output['error']= 0;
		return $output;
	}
	
	function merge($input)
	{
		$output= array();
		foreach($input as $row)
		{
			$temp= $row;
			$table= $this->table($row['type']);
			$query= 'SELECT *, app_users.record AS user, '.$table.'.record AS record, '.$table.'.id AS post_id, app_users.id AS user_id FROM '.$table.', app_users WHERE '.$table.'.record = "'.$row['record'].'" AND app_users.record= "'.$row['user'].'";';
			$result= @mysql_query($query);
			if(!$result)
			{
				$output['data']= 'Data could not be merged'.$row['type'];
				$output['debug']= $query.'<br />'.mysql_error();
				$output['error']= 1;
				return $output;
			}
			$rows= @mysql_fetch_assoc($result);
			if(!$rows)
			{
				return $query;	
			}
			
			foreach($rows as $key => $value)
			{
				if($key !== 'id')
				{
					$temp[$key]= $value;
				}		
			}
			$output[]= $temp;						
		}
		return $output;
	}
	
	function process_types($string)
	{
		$output= '';
		$types= explode(';', $string);
		foreach($types as $type){
			$output.= "'".$type."',";
		}			
		$output= substr_replace($output, "", -1);
		return $output;
	}
	
	//Profile
	function profile($args)
	{
		$output= array();
		$output['input']= $args;
		
		//record
		extract($args);
		
		$query= 'SELECT * FROM `app_users` WHERE `record` = "'.$record.'";';
		$result= @mysql_query($query);
		if(!$result)
		{
			$output['data']= 'Data could not be loaded';
			$output['debug']= $query.'<br />'.mysql_error();
			$output['error']= 1;
			return $output;
		}
		$data= array();
		while($row= @mysql_fetch_assoc($result))
		{
			$data[]= $row;	
		}
		
		$output['data']= $data;
		$output['debug']= $query;
		$output['error']= 0;
		return $output;
	}
	
	//Select
	function select($args)
	{
		$output= array();
		$output['input']= $args;
		
		//database, type, page, limit, hard, order, direction
		extract($args);
	
		//$offset= $limit*$page; 
		$table= $this->table($type);
		
		$sort= 'ORDER BY id DESC';
		if($order)
		{
			if(!$direction)
			{
				$direction= 'ASC';	
			}
			$sort= "ORDER BY ".$order." ".$direction;
		}
		
		$paging= '';
		if(!$limit)
		{
			$limit= 20;
		}
		if(!$offset)
		{
			$offset= 0;	
		}
		$paging= "LIMIT ".$offset.",".$limit;
		
		
		if(isset($args['advanced']))
		{
			$hard= 'AND '.$this->advanced($advanced);	
		}
		
		if($trash== true)
		{
			$trash= 'WHERE `privacy` = -1 ';
		}else{
			$trash= 'WHERE `privacy` != -1 ';	
		}
		
		$selector= '*';
		if($unique != NULL || $unique != '')
		{
			$selector= 'DISTINCT('.$unique.')';	
		}
		
		$query= "SELECT ".$selector." FROM ".$table." ".$trash." ".$hard." ".$sort." ".$paging.";";   
		$result= @mysql_query($query);
		if(!$result)
		{
			$output['data']= 'Data could not be loaded';
			$output['debug']= $query.'<br />'.mysql_error();
			$output['error']= 1;
			return $output;
		}
		$data= array();
		while($row= @mysql_fetch_assoc($result))
		{
			$data[]= $row;	
		}
		
		$output['data']= $data;
		$output['debug']= $query;
		$output['error']= 0;
		return $output;
	}
	
	//Add
	function add($args)
	{
		$output= array();
		$output['input']= $args;
		
		//type, data
		extract($args);
		
		$keys= '';
		$values= '';
		$table= $type;
		$uid= '';
		$i= 0;
		
		if(!isset($data['record'])){
			$data['record']= '';
		}
		foreach($data as $key => $value)
		{
			if($i != 0)
			{
				$keys.= ', ';
				$values.= ', ';
			}
			$pairs= $this->process_pairs($key, $value, array('type' => $type));
			$keys.= '`'.$pairs['key'].'`';
			$values.= $pairs['value'];
			$i++;
		}	
		$keys= str_replace('(, ', '', $keys);
		$values= str_replace('(, ', '', $values);
		
		$query= "INSERT INTO ".$this->table($table)." (".$keys.") VALUES (".$values.");";
		$result= @mysql_query($query);	
		if(!$result)
		{
			$output['data']= 'Data could not be inserted.';
			$output['debug']= $query.' '.mysql_error();
			$output['error']= 1;	
			return $output;
		}
		
		$new= @mysql_insert_id();
		$query= "SELECT * FROM ".$this->table($table)." WHERE `id` = '".$new."';";
		$result= @mysql_query($query);
		if(!$result)
		{
			$output['data']= 'Data could not be loaded after insert.';
			$output['debug']= $query.' '.mysql_error();
			$output['error']= 1;	
			return $output;
		}
		$entry= @mysql_fetch_assoc($result);
		if(!$entry)
		{
			$output['data']= 'There was an error during the loading process.';
			$output['debug']= $query.' '.mysql_error();
			$output['error']= 1;	
			return $output;
		}
				
		$output['data']= $entry;
		$output['debug']= $query;
		$output['error']= 0;	
		return $output;
	}
	
	//Edit
	function edit($args)
	{
		$output= array();
		$output['input']= $args;
		
		//type, data
		extract($args);
	
		$table= $type;
		$query= 'UPDATE '.$this->table($table).' SET ';
		$record= mysql_real_escape_string($data['record']);
		unset($data['record']);
		foreach($data as $key => $value)
		{
			$pairs= $this->process_pairs($key, $value, array('type' => $type));
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
	}
	
	//Delete
	function delete($args)
	{
		$output= array();
		$output['input']= $args;
		
		//type, record
		extract($args);
		
		$table= $type;
		$query= 'UPDATE '.$table.' SET level = "-1", modified = NOW() WHERE record = "'.mysql_real_escape_string($record).'"';
		$result= @mysql_query($query);
		if(!$result)
		{
			$output['data']= 'Data could not be deleted.';
			$output['error']= 1;
			$output['queries']= $query;	
			return $output;	
		}
		
		$output['data']= $result;
		$output['error']= 0;
		$output['debug']= '';
		return $output;
	}
	
	//Total
	function total($args)
	{
		$output= array();
		$output['input']= $args;
		
		//type, hard
		extract($args);
		
		$table= $type;
		
		if(isset($args['advanced']))
		{
			$hard= 'AND '.$this->advanced($advanced);	
		}
		
		if($trash== true)
		{
			$trash= 'WHERE `level` = -1 ';
		}else{
			$trash= 'WHERE `level` != -1 ';	
		}
		
		$query= "SELECT COUNT(*) FROM ".$table." ".$trash." ".$hard; 
		$result= @mysql_query($query);
		if(!$result)
		{
			$output['data']= 'Total data could not be calculated.';
			$output['debug']= $query;	
			$output['error']= 1;
			return $output;
		}
		$total= @mysql_fetch_array($result);
			
		$output['data']= $total[0];
		$output['error']= 0;
		$output['debug']= $query;
		return $output;
	}
			
	//Unique
	function unique($args)
	{
		$output= array();
		$output['input']= $args;
		
		///type, field
		extract($args);
		
		$table= $type;
		
		$query= 'SELECT DISTINCT('.$field.') FROM '.$table;
		$result= @mysql_query($query);	
		if(!$result)
		{
			$output['data']= 'Could not load unique list.';
			$output['debug']= $query;
			$output['error']= 1;	
			return $output;
		}
		
		$data= array();
		while($row= @mysql_fetch_assoc($result))
		{
			$data[]= $row;
		}	
		
		$output['data']= $data;
		$output['debug']= $query;
		$output['error']= 0;
		return $output;
	}	
	
	//Process Pairs
	private function process_pairs($key, $value, $args)
	{
		$output= array();
		$output['key']= $key;
				
		//type, api_key
		extract($args);
				
		switch($key)
		{	
			case 'id':
				if($value != '')
				{
					if($value== 'undefined')
					{
						$output['value']= "''";
					}else{
						$output['value']= $value;
					}
				}else{
					$output['value']= "''";	
				}
				return $output;
			break;	
			case 'record':
				if($value!= '' && $value!= 'undefined')
				{
					$output['value']= "'".$value."'";
				}else{
					$record= $this->create_uid(array('type' => $type));
					$output['value']= "'".$record['data']."'";
				}
				return $output;
			break;
			/** 
				-WHEN CREATING AN ENTRY, 'CREATED' MUST BE SET TO NULL IN ORDER TO SET CREATION TIME
				-WHEN MODIFYING AN ENTRY, THE 'CREATED' FIELD MUST BE OMITTED IN ORDER TO PREVENT THE AUTO-UPDATE
				CREATED- TIMESTAMP NOT NULL CURRENT_TIMESTAMP
				MODIFIED- TIMESTAMP NOT NULL DEFAULT 0
				USE NOW() WITHOUT QUOTES TO SET MODIFIED TO CURRENT DATE/TIME
			**/	
			case 'created':
				if($value!= '')
				{
					$output['value']= "'".$value."'";
				}else{
					$output['value']= "NULL";
				}
				return $output;
			break;	
			case 'modified':
				if($value!= '')
				{
					$output['value']= "'".$value."'";
				}else{
					$output['value']= "NOW()";
				}
				return $output;
			break;
			default:
				switch($value)
				{
					case 'undefined':
						$output['value']= "''";
						return $output;
					break;
					/*case '':
	
					break;*/
					default:
						//if(is_numeric($value)){
						//	$values.= mysql_real_escape_string($value);
						//}else{
							if(is_array($value))
							{
								$output['value']= "'".serialize($value)."'";
							}else{
								$output['value']= "'".mysql_real_escape_string($value)."'";
							}
							return $output;
						//}
					break;
				}
			break;	
		}
	}
	
	//Advanced 
	private function advanced($input){
		$output= '';
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
				$output.= sprintf('`%s` %s "%s" %s', $field, $operator, $value, $logic);
			}
		}
		return $output;
	}
	
	//UID
	function create_uid($args)
	{	
		//type, api_key
		extract($args);
		
		$pre= substr($type, 0, 3);
		$pre= strtoupper($pre);
		$table= $type;
		$date= date('ymd');
		$query= "SELECT record FROM ".$this->table($table)." WHERE record LIKE '".$pre."-".$date."%' ORDER BY id DESC";
		$result= @mysql_query($query);
		
		$row= @mysql_fetch_array($result);
		if(!$row)
		{
			$uid= $pre.'-'.$date.'-001-A';
			$output['data']= $uid;
			return $output;
		}else{
			$temp= split('-', $row[0]);
			$i= intval($temp[2]);
			$group= $temp[3];
			if($i == 999)
			{
				$number= 1;
				$group++;
			}else{
				$number= ($i+1);	
			}
			$number= $this->add_zeros($number);
			$uid= $pre.'-'.$date.'-'.$number.'-'.$group;
			$output['data']= $uid;
			return $output;
		}
	}
	
	function add_zeros($number)
	{
		if(strlen($number) == 1)
		{
			return '00'.$number;	
		}else if(strlen($number) == 2)
		{
			return '0'.$number;	
		}else if(strlen($number) == 3)
		{
			return $number;	
		}else{
			return $number;	
		}
	}
}
global $phourus_data;
$phourus_data= new phourus_data();

?>