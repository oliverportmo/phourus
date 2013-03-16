<?php

global $Q;
$Q= array();


/** ===== AUTH.PHP ===== **/
/** LOGIN
  * Simply looks for @username and @password match in database. Need to hash passwords server-side before storing them in DB. Obviously.
  *
  * @username String
  * @password String
  * @key String 'username' || 'email' only valid options
**/
$Q['login']= "

SELECT * 

FROM :users 

WHERE `:key` = ':username' 

AND `password` = ':password';";


/** PROFILE
  * Load profile from :users table by :id
  *
  * @id String
  * @users String
**/   
$Q['profile']= '

SELECT * 

FROM `:users` 

WHERE id = :id;';




/** MERGE
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
$Q['merge']= '

SELECT *, :users.record 

AS user, :table.record 

AS record, :table.id 

AS post_id, :users.id 

AS user_id 

FROM :table, :users 

WHERE :table.record = :record 

AND :users.record= :user;';




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
$Q['load']= "SELECT views FROM `app_stream` :trash;"; 




/** ADD
  * Used to created new record in :table
  * 
  * @table String- Which table to enter data into
  * @keys String- Comma-separated list of table columns
  * @values String- List of values to match :keys
**/
$Q['add']= "

INSERT INTO :table 

(:keys) VALUES (:values);";




/** EDIT
  * Sets :pairs to resource at :id
  *
  * @table String- Table to update
  * @pairs String- String of comma-separated 'key' = 'value' pairs
  * @id String- Resource id to update
**/
$Q['edit']= '

UPDATE :table

SET :pairs

WHERE id = ":id"';




/** DELETE
  * Delete does not delete the entry from the database, but it sets it's privacy to -1
  * Deleted entries can still be loaded by using a 'true' value for @trash
  *
  * @table String- Table record belongs to
  * @id String- UID to be deleted
**/
$Q['delete']= '

UPDATE :table 

SET level = "-1", 

modified = NOW() 

WHERE id = ":id"';




/** TOTAL
  * Used to count total number of records available in table 
  * 
  * @trash String- Whether to show either deleted or normal entries
  * @hard String- String for hard-coded nodifiers
**/
$Q['total']= '

SELECT COUNT(*) 

FROM :table 

:trash :hard'; 




/** UNIQUE
  * Used to load all the unique values available in :table for a certain :field
  *
  * @table String- Table to search
  * @field String- Field to find unique values of
**/
$Q['unique']= '

SELECT DISTINCT(:field) 

FROM :table';


/** ===== UTILITY.PHP ===== **/
/** UID
  * Generates Unique Identifier for foreign-key relationships. Most likely will change.
  *
  * @username String
  * @password String
  * @key String 'username' || 'email' only valid options
**/
$Q['uid']= "

SELECT record 

FROM ".table($table)." 

WHERE record 

LIKE '".$pre."-".$date."%' 

ORDER BY id DESC";

?>