<?php

	ini_set('display_errors', 1);
  $root= '../../../php/rest/classes/';
  $base= $root.'objects/';
  require($base.'oAddress.php');
  require($base.'oClout.php');
  require($base.'oComment.php');
  require($base.'oFollow.php');
  require($base.'oOrg.php');
  //require($base.'oPermissions.php');
  require($base.'oPost.php');
  require($base.'oReview.php');
  require($base.'oSession.php');
  require($base.'oStats.php');
  require($base.'oTag.php');
  require($base.'oThumb.php');
  require($base.'oUser.php');
  require($base.'oView.php');
  
  $base= $root.'data/';
  require($base.'dCreate.php');
  require($base.'dDelete.php');
  require($base.'dRead.php');
  require($base.'dUpdate.php');
  
  $base= $root.'utility/';
  require($base.'uQueries.php');
  require($base.'uResult.php');
  require($base.'uUtilities.php');
  
  function curl($url, $options= null){ 
  	$ENV= 'local';
		
		if($ENV== 'dev'){
			$base= 'https://dev.phourus.com/rest/';	
		}else if($ENV== 'prod'){
			$base= 'https://phourus.com/rest/';
		}else{
			$base= 'http://www.phourus.local/rest/';
		}	
		
  	$headers= array();
  	$ch= curl_init($base.$url);
  	
  	$token= 'ENlnLTHKlpkr5XYeaS7G';
		$user_id= 1;
  	$headers= array("x-api-key: $token", "from: $user_id");
  	if($options != null){
    	extract($options);
  	}  	
  	if(isset($guest)){
    	$headers= array();
  	}
  	if(isset($auth)){
      $headers= array("Authentication: Basic $auth");
  	}
  	
  	if(isset($post) && is_array($post)){
      curl_setopt($ch, CURLOPT_POST, TRUE);
      curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
    }
    if(isset($put) && is_array($put)){
      //curl_setopt($ch, CURLOPT_PUT, TRUE);
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
      curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "PUT");
      curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($put));
      //$headers= array_merge($headers, array('Content-Type: application/x-www-form-urlencoded', 'Accept: application/json'));
      /*$handle = tmpfile();
      $size = fwrite($handle, json_encode($put));
      rewind($handle);
      curl_setopt($ch, CURLOPT_PUT, true);
      curl_setopt($ch, CURLOPT_INFILE, $handle);
      curl_setopt($ch, CURLOPT_INFILESIZE, strlen($size));*/
    }
    if(isset($delete) && $delete== true){
      curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "DELETE");
    }
    
  	curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
		curl_setopt ($ch, CURLOPT_RETURNTRANSFER, true);
		$result = curl_exec($ch);
		return json_decode($result, true);
	}

?>