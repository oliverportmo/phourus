<?php

class pUser
{	
	
	public function create($model){
		$create= new apiCreate();
		$out= $create->user($model);	
		return $out;
	}
	
	public function get($id){
		$read= new apiRead();
		$out= $read->user($id);
		return $out;
	}
	
	public function update($id, $model){
		$update= new apiUpdate();
		$out= $update->user($id, $model);
		return $out;
	}
	
	public function delete(){
		$delete= new apiDelete($id);
		$out= $delete->user($id);
		return $out;
	}
}

?>