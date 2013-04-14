<?php

class apiQueries {
	function __construct($params){
		extract($params);
	
/** ===== AUTH.PHP ===== **/
/** LOGIN
  * Simply looks for @username and @password match in database. Need to hash passwords server-side before storing them in DB. Obviously.
  *
  * @username String
  * @password String
  * @key String 'username' || 'email' only valid options
**/
$this->login= "SELECT * FROM app_users WHERE `$key` = '$username' AND `password` = '$password';";




/** SESSION
  * Simply looks for @username and @password match in database. Need to hash passwords server-side before storing them in DB. Obviously.
  *
  * @username String
  * @password String
  * @key String 'username' || 'email' only valid options
**/
$this->session= "SELECT * FROM app_sessions WHERE token = '$token' AND user = '$user';";




/** USER
  * Load user from users table by :id
  *
  * @id String
**/   
$this->user= "SELECT * FROM app_users WHERE user_id = '$id';";


/** POST
  * Works in conjunction with stream(), which basically just uses load() to output data from 'stream' table, 
  * which is then looped through using this query.
  *
  * Essentially the challenge is that in a stream there are various types of data (blogs, events etc.), so a JOIN can't be used
  * because the @table varies in a batch of posts from stream()
  *
  * @table String
  * @record String
  * @user String
  * @users String
**/  
$this->post= "SELECT * FROM $table WHERE id = '$id';";




/** META
  * Works in conjunction with stream(), which basically just uses load() to output data from 'stream' table, 
  * which is then looped through using this query.
  *
  * Essentially the challenge is that in a stream there are various types of data (blogs, events etc.), so a JOIN can't be used
  * because the @table varies in a batch of posts from stream()
  *
  * @table String
  * @record String
  * @user String
  * @users String
**/  
$this->meta= "SELECT * FROM app_stream WHERE stream_id = '$id';";

/** STREAM
  * Returns ids of posts to be run through single()
  *
  * @selector Array- Array of column names. Defaults to * if null
  * @table String- Table to SELECT data from, which must return string value from table() 
  * @trash Boolean- true or false whether response should be normal items or trash items
  * @hard Array- Array of values for AND/OR operators in format ['key', 'operator', 'value', 'AND\OR']
  * @asc Boolean- Whether or not dataset is sorted ascending or descending, according to @field
  * @field String- Field to sort by
  * @page int- Current page number
  * @limit int- Records per page
  *
  * NOTE: The load() method handles the processing, and reduces the value to a string, which is what is used below
  * Trash parameter is a boolean that either sets 'WHERE level != -1' or 'WHERE level = -1', with the latter being if 'trash' is true 
  * Hard parameter accepts an array, and then generates a string like 'AND 'mycolumn' != 'myvalue' OR' and then injects the string $hard
  * Page & Limit parameters are passed to load(), but returns a single string value $paging
  *
**/
$this->stream= "SELECT stream_id FROM app_stream $privacy $mode $types $order $paging"; 




/** ADD
  * Used to created new record in :table
  * 
  * @table String- Which table to enter data into
  * @keys String- Comma-separated list of table columns
  * @values String- List of values to match :keys
**/
$this->add= "INSERT INTO :table (:keys) VALUES (:values);";




/** EDIT
  * Sets :pairs to resource at :id
  *
  * @table String- Table to update
  * @pairs String- String of comma-separated 'key' = 'value' pairs
  * @id String- Resource id to update
**/
$this->edit= 'UPDATE :table SET :pairs WHERE id = ":id"';




/** DELETE
  * Delete does not delete the entry from the database, but it sets it's privacy to -1
  * Deleted entries can still be loaded by using a 'true' value for @trash
  *
  * @table String- Table record belongs to
  * @id String- UID to be deleted
**/
$this->delete= "UPDATE app_stream SET privacy = '-1', modified = NOW() WHERE id = '$id'";




/** TOTAL
  * Used to count total number of records available in table 
  * 
  * @trash String- Whether to show either deleted or normal entries
  * @hard String- String for hard-coded nodifiers
**/
$this->total= "SELECT COUNT(*) FROM $table $trash $hard"; 




/** UNIQUE
  * Used to load all the unique values available in :table for a certain :field
  *
  * @table String- Table to search
  * @field String- Field to find unique values of
**/
$this->unique= "SELECT DISTINCT($field) FROM $table";




/** ===== UTILITY.PHP ===== **/
/** UID
  * Generates Unique Identifier for foreign-key relationships. Most likely will change.
  *
  * @username String
  * @password String
  * @key String 'username' || 'email' only valid options
**/
$this->uid= "

SELECT record 

FROM ".table($table)." 

WHERE record 

LIKE '".$pre."-".$date."%' 

ORDER BY id DESC";

/** ===== DATA.PHP ===== **/
/** LOAD
  * Generic SELECT statement. Current implementation has serious SQL injection security implications.
  *
  * @selector Array- Array of column names. Defaults to * if null
  * @table String- Table to SELECT data from, which must return string value from table() 
  * @trash Boolean- true or false whether response should be normal items or trash items
  * @hard Array- Array of values for AND/OR operators in format ['key', 'operator', 'value', 'AND\OR']
  * @asc Boolean- Whether or not dataset is sorted ascending or descending, according to @field
  * @field String- Field to sort by
  * @page int- Current page number
  * @limit int- Records per page
  *
  * NOTE: The load() method handles the processing, and reduces the value to a string, which is what is used below
  * Trash parameter is a boolean that either sets 'WHERE level != -1' or 'WHERE level = -1', with the latter being if 'trash' is true 
  * Hard parameter accepts an array, and then generates a string like 'AND 'mycolumn' != 'myvalue' OR' and then injects the string $hard
  * Page & Limit parameters are passed to load(), but returns a single string value $paging
  *
**/
$this->load= "SELECT $selector FROM `$table` $trash $hard $sort $paging"; 


/*
$this->stream= "

CREATE VIEW stream AS SELECT app_stream AS stream, core_blogs AS blogs, core_events AS events FROM stream, blogs, events WHERE level != -1 ORDER BY influence DESC LIMIT 0,10
";
*/

	}
}

?>