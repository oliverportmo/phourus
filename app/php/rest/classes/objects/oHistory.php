<?php

class oHistory
{	
	
	# GET
	public function get($params){
		$views= dRead::views($params);
		if(is_numeric($views)){
  		return $views;
		}
		$out= array();
		foreach($views as $view){
		  if(!is_null($view['user_id'])){
  		  $out[]= oUser::get(array('id' => $view['user_id']));
		  }else if(!is_null($view['org_id'])){
  		  $out[]= oOrg::get(array('id' => $view['org_id']));
		  }else if(!is_null($view['post_id'])){
  		  $out[]= oPost::get(array('id' => $view['post_id']));
		  }
		}
		return $out;
	}
}

?>