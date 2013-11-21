<?php

class oEmail
{	
	
	# GET
	public function create($params)
	{
		$sender = "Phourus.com";
		$sender_email = "info@phourus.com";
		//mode, email
		extract($params);
		
		//message, subject
		$template = self::template($params);
		extract($template);
		
		//Headers
		$headers  = "MIME-Version: 1.0 \r\n";
		$headers .= "Content-type: text/html; charset=iso-8859-1 \r\n";
		$headers .= "To: $recipient <$email> \r\n";
		$headers .= "From: $sender <$sender_email> \r\n";
		$headers .= "Bcc: $sender_email \r\n";
		
		$mail= @mail($email, $subject, $message, $headers);
		if(!$mail){
			$out= 'There was an error sending email.';
			return 503;
		}
		
		$out= 'Email sent successfully.';
		return true;
	}
	
	
	private function template($params = array())
  {
    extract($params);
    ob_start();
    $template = "../../../emails/$mode.php";
    require($template);
    $out = ob_get_contents();
    ob_end_clean();
    return $out;
  }
	
}

?>