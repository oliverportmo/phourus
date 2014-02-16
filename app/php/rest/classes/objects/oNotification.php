<?php

class oNotification
{	
	
	# GET
	public function get($params){
		$notifications= dRead::notifications($params);
		if(is_numeric($notifications)){
  		return $notifications;
		}
		$out= array();
		foreach($notifications as $n){
  		$e = $n;	  
		  $type= $n['type'];
		  if($type == 'comment' || $type == 'post' || $type == 'thumb'){
  		  $e['post']= oPost::get(array('id' => $n['target_id']));  
  		  $e['user']= oUser::get(array('id' => $n['user_id']));
		  }else if($type == 'member'){
  		  $e['org']= oOrg::get(array('id' => $n['user_id']));
		  }else if($type == 'favorite' || $type == 'view'){
  		  $e['user']= oUser::get(array('id' => $n['user_id']));
		  } 
		  $out[]= $e;
		}
		return $out;
	}
}

?>