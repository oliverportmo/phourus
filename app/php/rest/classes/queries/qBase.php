<?php

class qBase 
{

	# get
	public static function get($id, $type){
    $table= uUtilities::table($type);
    return sprintf("SELECT * FROM `%s` WHERE id = %d;", $table, $id);
	}
	
	# create
	public static function create($model, $type){		
		$table= uUtilities::table($type);		
		$pairs= uUtilities::pairs($model);
		return sprintf("INSERT INTO `%s` (%s) VALUES (%s);", $table, $pairs['keys'], $pairs['values']);
	}	

	# update
	public static function update($id, $type, $model){
		$table= uUtilities::table($type);
		unset($model['id']);
		unset($model['created']);
		$model['modified']= 'NOW()';
		
		$pairs= uUtilities::pairs($model, true);  
		return sprintf("UPDATE `%s` SET %s WHERE id = %d;", $table, $pairs, $id);		
	}
	
	# delete
	public static function delete($id, $type){
		$table= uUtilities::table($type);
		// trash?
		// return sprintf("UPDATE `%s` SET status = -1, modified = NOW() WHERE id = %d;", $table, $id);	
		return sprintf("DELETE FROM `%s` WHERE id = %d;", $table, $id);	
	}
}

?>