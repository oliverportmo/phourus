<?php

class oOrg
{	
	
	# GET
	public function get($params){
	  if(isset($params['id'])){
  	  $out= dRead::org($params);
	  }else{
	    $params['mode']= 'id';
  	  $ids= dRead::org($params);
  	  if(is_numeric($ids)){
    	  return $ids;
  	  }
  	  foreach($ids as $id){
    	  $out[]= dRead::org(array('id' => $id['id']));
  	  }
	  }
		return $out;	
	}
	
	# POST
	public function create($model){
		$out= dCreate::create($model, 'org');	
		return $out;
	}
	
	# PUT
	public function update($id, $model){
		$out= dUpdate::update($id, 'org', $model);
		return $out;
	}
	
	# DELETE
	public function delete($id){
		$out= dDelete::delete($id, 'org');
		return $out;
	}
}

?>