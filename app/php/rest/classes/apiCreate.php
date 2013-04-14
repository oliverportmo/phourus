<?php

class apiCreate {
	
	var $_model;	
	var $_keys; 
    var $_values; 
	
	public function user($params){
		
	}
	
	public function single($params){
		
	}
	
	public function session($user, $password){
		
	}
	
	
	/** LEGACY **/
	public function __construct($model){
		
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
		//single, profile, session, email
		$query= $Q[$q];
		$query->execute($this->_data);
		
		$id= $db->lastInsertId();
		$last= $Q[$q];
		$last->execute($id);
		$last->setFetchMode(PDO::FETCH_ASSOC); 
		$out= $row= $last->fetch();
		return $out;
	}
	
	// Session
	private function token(){
		date_default_timezone_set('UTC');
		$expires = date( 'Y-m-d H:i:s', strtotime('+60 Minutes'));
		
		$out= array();
		$out['expires']= $expires;
		$out['token']= 'token must be read from DB';
		return $out;
	}
	
	private function decode($auth){
		$parsed= str_replace("Basic ", "", $auth);
		$decoded= base64_decode($parsed);
		$exploded= split(':', $decoded);
		return $exploded;
	}
	
	//Email
	private function email(){
		$data= post_email($vars);
		$output= json_encode($data);
		//subject, message, recipient_email, recipient_name, sender_email, sender_name
		
		//Headers
		$headers  = 'MIME-Version: 1.0' . "\r\n";
		$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
		$headers .= 'To: '.$args['recipient_name'].' <'.$args['recipient_email'].'>' . "\r\n";
		$headers .= 'From: '.$args['sender_name'].' <'.$args['sender_email'].'>' . "\r\n";
		//$headers .= 'Cc: email@example.com' . "\r\n";
		$headers .= 'Bcc: '.$args['recipient_name'] . "\r\n";
		
		$mail= @mail($args['recipient_email'], $args['subject'], $args['message'], $headers);
		if(!$mail){
			$out= 'There was an error sending email.';
			return $out;
		}
		
		$out= 'Email sent successfully.';
		return $out;
	}

	/** CREATE TRAIT **/
	//Pairs- Key/value pre-processing
	private function pairs($key, $value, $args)
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
					$record= create_uid(array('type' => $type));
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
	
	//UID- Server-side UID implementation to be removed, replaced with DB trigger, composite key, or auto-increment
	private function create_uid($args)
	{	
		//type, api_key
		extract($args);
		
		$pre= substr($type, 0, 3);
		$pre= strtoupper($pre);
		$table= $type;
		$date= date('ymd');
		/** ===== 'uid' Query ===== **/
		$query= "SELECT record FROM ".table($table)." WHERE record LIKE '".$pre."-".$date."%' ORDER BY id DESC";
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
			$number= pad_zeros($number);
			$uid= $pre.'-'.$date.'-'.$number.'-'.$group;
			$output['data']= $uid;
			return $output;
		}
	}
	
	private function pad_zeros($number)
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

?>