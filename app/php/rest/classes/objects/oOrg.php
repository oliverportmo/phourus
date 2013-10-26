<?php

class oOrg
{	
	
	# GET
	public function get($params){
	  if(isset($params['id'])){
  	  $out= dRead::orgs($params);
	  }else{
	    $params['mode']= 'id';
  	  $ids= dRead::orgs($params);
  	  foreach($ids as $id){
    	  $out[]= dRead::orgs(array('id' => $id['id']));
  	  }
	  }
		return $out;	
	}
	
	# POST
	public function create($model){
		$out= dCreate::create($model, 'orgs');	
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