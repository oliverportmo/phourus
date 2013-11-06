<?php 

class mPermissions extends \Slim\Middleware
{
  public function call(){
    $request= $this->app->request(); 
    $headers = $request->headers();
    $method = $request->getMethod();
    $resource = $request->getResourceUri();
    $response = $this->app->response();

    $auth_id= oSession::auth($headers);
    if($auth_id== false){
      $response->status(401);
      //$rsp->body(json_encode(false));
     	$response->body(json_encode($headers));
     	return false;
    }
    
    if($request->isPut() || $request->isDelete()){
      $r= dRead::owner($auth_id, $resource);
      if(!$r){
        $response->status(403);
        //$rsp->body(json_encode(false));
        //return false;    
      }
    }
    $GLOBALS['phourus_auth_id']= $auth_id;
    $this->next->call();
  }  
}

?>