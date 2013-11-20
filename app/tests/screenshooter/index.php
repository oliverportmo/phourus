<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Test Results</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="../browsers.js"></script>
</head>

<body>
<div id="browsers"></div>
<?php

if(isset($_GET['date']) && isset($_GET['page']))
{
	echo '<a href="?date='.$_GET['date'].'">Go back</a><br />';
	$files= scandir('screenshots/'.$_GET['date'].'/'.$_GET['page']);
	unset($files[0]);
	unset($files[1]);
	foreach($files as $file)
	{
		echo '<h1>'.$file.'</h1>';
		echo '<img src="/tests/screenshooter/screenshots/'.$_GET['date'].'/'.$_GET['page'].'/'.$file.'" />';
	}
}else if(isset($_GET['date']) && !isset($_GET['page'])){
	$directory= 'screenshots/'.$_GET['date'].'/';
	$directories= glob($directory."*", GLOB_ONLYDIR);
	$dir= explode('/', $directory);
	echo '<a href="?">Go back</a><br />';
	foreach($directories as $directory)
	{
		$dir= explode('/', $directory);
		echo '<a href="?date='.$_GET['date'].'&page='.$dir[2].'" >'.$dir[2].'</a><br />';
	}
}else if(!isset($_GET['date']) && !isset($_GET['page'])){
	$directory= 'screenshots/';
	$directories= glob($directory."*", GLOB_ONLYDIR);
	$dir= explode('/', $directory);
	
	foreach($directories as $directory)
	{
		$dir= explode('/', $directory);
		echo '<a href="?date='.$dir[1].'" >'.$dir[1].'</a><br />';
	}
}

?>

</body>
</html>