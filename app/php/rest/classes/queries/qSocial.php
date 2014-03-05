<?php

class qSocial {
  
  # views
	public static function views($params){
		$where= '';
		if(isset($params['viewer_id'])){
  		$where= sprintf("WHERE viewer_id = %d", $params['viewer_id']);
		}else if(isset($params['id'])){
  		$where= sprintf("WHERE id = %d", $params['id']);
		}else if(isset($params['post_id'])){
  		$where= sprintf("WHERE post_id = %d", $params['post_id']);
		}else if(isset($params['user_id'])){
  		$where= sprintf("WHERE user_id = %d", $params['user_id']);
		}else if(isset($params['org_id'])){
  		$where= sprintf("WHERE org_id = %d", $params['org_id']);
		}else{
  		return false;
		}
		
		$paging= uQuery::paging($params);		
	  return sprintf("SELECT * FROM `%s` %s %s;", TABLE_VIEWS, $where, $paging);
	}
	
	# thumbs
	public static function thumbs($params){
	  $where= "";
	  if(isset($params['user_id']) && isset($params['post_id'])){
  	  $where= sprintf("WHERE user_id = %d AND post_id = %d", $params['user_id'], $params['post_id']);
	  }else if(isset($params['id'])){
  	  $where= sprintf("WHERE id = %d", $params['id']);
	  }else if(isset($params['user_id'])){
  	  $where= sprintf("WHERE user_id = %d", $params['user_id']);
	  }else if(isset($params['post_id'])){
  	  $where= sprintf("WHERE post_id = %d", $params['post_id']);
	  }else{
  	  return false;
	  }
		return sprintf("SELECT * FROM `%s` %s;", TABLE_THUMBS, $where);
	}
		
	# comments
	public static function comments($params){
	  $where= '';
	  if(isset($params['post_id'])){
  	  $where= sprintf("WHERE post_id = %d", $params['post_id']);
	  }else if(isset($params['user_id'])){
  	  $where= sprintf("WHERE user_id = %d", $params['user_id']);
	  }else if(isset($params['id'])){
  	  $where= sprintf("WHERE id = %d", $params['id']);
	  }else{
  	  return false;
	  }
		return sprintf("SELECT * FROM `%s` %s;", TABLE_COMMENTS, $where);
	}
	
	# favorites
	public static function favorites($params){
	  if(isset($params['target_id']) && isset($params['user_id'])){
  	  $where= sprintf("WHERE user_id = %d AND target_id = %d", $params['user_id'], $params['target_id']);
	  }else if(isset($params['user_id'])){
  	  $where= sprintf("WHERE user_id = %d", $params['user_id']);
	  }else if(isset($params['target_id'])){
  	  $where= sprintf("WHERE target_id = %d", $params['target_id']);
	  }else if(isset($params['id'])){
  	  $where= sprintf("WHERE id = %d", $params['id']);
	  }else{
  	  return false;
	  }
		return sprintf("SELECT * FROM `%s` %s;", TABLE_FAVORITES, $where);
	}
}

?>