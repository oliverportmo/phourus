<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Test Results</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
</head>

<body>

<?php

$files= scandir('results');
unset($files[0]);
unset($files[1]);
foreach($files as $file)
{
	echo '<h1>'.$file.'</h1>';
	@include('results'.$file); 
}

?>

</body>
</html>