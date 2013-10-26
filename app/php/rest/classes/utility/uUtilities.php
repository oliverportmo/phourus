<?php

class uUtilities
{
	
	/** REPLACE WITH CONSTANTS **/	
	public function table($type)
	{
		$tables= array();	
		$tables['blogs']= 'core_blogs';
		$tables['ideas']= 'core_ideas';
		$tables['links']= 'core_links';
		$tables['events']= 'core_events';
		
		$tables['checklist']= 'earth_matters';
		$tables['calculator']= 'earth_matters';
		$tables['matters']= 'earth_matters';
		$tables['stores']= 'earth_stores';
		
		$tables['subjects']= 'mind_subjects';
		$tables['questions']= 'mind_questions';
		$tables['answers']= 'mind_answers';
		$tables['scores']= 'mind_scores';
		
		$tables['debates']= 'voice_debates';
		$tables['bills']= 'voice_bills';
		$tables['votes']= 'voice_votes';
		$tables['budget']= 'voice_budget';
		
		$tables['beliefs']= 'self_beliefs';
		$tables['quotes']= 'self_quotes';
		$tables['timeline']= 'self_timeline';
		$tables['ranks']= 'self_ranks';	
		
		$tables['stream']= 'app_stream';
		
		$tables['view']= "app_views";
		$tables['views']= "app_views";
		$tables['comment']= "app_comments";
		$tables['comments']= "app_comments";
		$tables['thumb']= "app_thumbs";
		$tables['thumbs']= "app_thumbs";
		$tables['follow']= "app_follows";
		$tables['follows']= "app_follows";
		$tables['address']= "app_address";
		$tables['addresses']= "app_address";
		$tables['post']= 'app_posts';
		$tables['posts']= 'app_posts';
		$tables['user']= 'app_users';
		$tables['users']= 'app_users';	
		$tables['org']= 'app_orgs';
		$tables['orgs']= 'app_orgs';	
		$tables['clout']= 'app_clout';
		$tables['review']= 'app_reviews';
		$tables['reviews']= 'app_reviews';
		$tables['tag']= 'app_tags';
		$tables['tags']= 'app_tags';
		if(array_key_exists($type, $tables)){
			return $tables[$type];
		}
		return false;	
	}
	
	// Session
	public function token($length= 20, $charset='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'){
	    $str = '';
	    $count = strlen($charset);
	    while ($length--) {
	        $str .= $charset[mt_rand(0, $count-1)];
	    }
	    return $str;
	}
	
	public function expires(){
		date_default_timezone_set('UTC');
		$out = date( 'Y-m-d H:i:s', strtotime('+60 Minutes'));
		return $out;
	}
	
	public function decode($auth){
		$parsed= str_replace("Basic ", "", $auth);
		$decoded= base64_decode($parsed);
		$exploded= split(':', $decoded);
		$out= array();
		$out['username']= $exploded[0];
		$out['password']= $exploded[1];
		return $out;
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

	public function now(){
    return date('Y-m-d H:i:s');	
	}
	
	/** LEGACY **/
	public static function pairs($model, $update= false){		
		$i= 0;
		$keys= '';
		$values= '';

		if($update== true){
  		foreach($model as $key => $value)
  		{	
    		$value= uUtilities::values($key, $value);
    		$out.= "`$key` = $value, ";
      }
      $out= substr($out, 0, -2);
    }else if($update== false){
      foreach($model as $key => $value)
  		{	
  			if($i != 0)
  			{
  				$keys.= ', ';
  				$values.= ', ';
  			}
  			$value= uUtilities::values($key, $value);
  			$keys.= '`'.$key.'`';
  			$values.= $value;
  			$i= 1;
  		}
  		$out['keys']= str_replace('(, ', '', $keys);
  		$out['values']= str_replace('(, ', '', $values);	
    }
    return $out;
	}

	//Pairs- Key/value pre-processing
	public static function values($key, $value)
	{						
		switch($key)
		{	
			case 'id':
			  // If is empty, return empty
				if($value != '')
				{
				  // If not empty, but undefined, return empty
					if($value== 'undefined')
					{
						return "''";
					// Else return value
					}else{
						return $value;
					}
				}else{
					return "''";	
				}
			break;	
			case 'post_id':
			 if($value == 'LAST_INSERT_ID()'){
  			 return "LAST_INSERT_ID()";
			 }else{
  			 return $value;
			 }
			break;
			case 'created':
			  // On create, pass NULL or unset created field to set created to DEFAULT value (CURRENT_TIMESTAMP)
			  // On update, pass empty string or current value
				$match= preg_match('/[0-9]{4}-[0-9]{2}-[0-9]{2}/', $value);
			  if($match== true && $value != '0000-00-00 00:00:00'){
  			  return $value;
			  }
				return 'NULL';
			break;
			case 'modified':
			  $match= preg_match('/[0-9]{4}-[0-9]{2}-[0-9]{2}/', $value);
			  if($match== true && $value != '0000-00-00 00:00:00'){
  			  return $value;
			  }
			  return 'NOW()';
			break;	
			default:
				if($value== 'undefined'){
					return "''";
				}else if(is_array($value)){
					return "'".serialize($value)."'";
				}else{
					return "'".$value."'";
				}
			break;	
		}		
	}
	
	/*
		//type, api_key
	extract($args);
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
	
	//UID- Server-side UID implementation to be removed, replaced with DB trigger, composite key, or auto-increment
	/*
	private function create_uid($args)
	{	
		//type, api_key
		extract($args);
		
		$pre= substr($type, 0, 3);
		$pre= strtoupper($pre);
		$table= $type;
		$date= date('ymd');
		/** ===== 'uid' Query ===== **
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
	}	*/
}
	
?>