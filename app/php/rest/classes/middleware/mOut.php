<?php 

class mOut extends \Slim\Middleware
{
  public function call(){
    $app= $this->app;
    $response= $app->response();
  	//$app->contentType('application/json');
  	$app->response()->header('Content-type', 'application/javascript');
  	$code= 200;
  	if($data== false){
    	$code= 404;
  	}
  	$response->isServerError();
    $this->next->call();
  	//$response->body(json_encode($out));      	
  }  
}

?>