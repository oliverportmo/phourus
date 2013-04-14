<?php

class pSingle
{	
	
	public function create(){
		
	}
	
	public function get($id){
		$read= new apiRead();
		
		/** USER & META SHOULD BE JOINED **/
		$meta= $read->meta($id);
		$user= $read->user($meta['user_id']);
		
		/** IF POSSIBLE, SHOULD BE REPLACED WITH JOIN USING 'TYPE' COLUMN TO SET 'POST' TABLE NAME DYNAMICALLY  **/
		$post= $read->post($id, $meta['type']);
		$out= array_merge($meta, $post, $user);
		return $out;	
	}
	
	public function update(){
		
	}
	
	public function delete(){
		$delete= new apiDelete($id);
		$out= $delete->result('delete');
		return $out;
	}
}

?>