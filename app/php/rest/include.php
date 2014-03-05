<?php

$base= 'classes/objects/';
require($base.'oAddress.php');
require($base.'oClout.php');
require($base.'oComment.php');
//require($base.'oEmail.php');
require($base.'oFavorite.php');
require($base.'oInfluence.php');
require($base.'oOrg.php');
require($base.'oPost.php');
require($base.'oReview.php');
require($base.'oSession.php');
require($base.'oTag.php');
require($base.'oThumb.php');
require($base.'oUser.php');
require($base.'oView.php');

$base= 'classes/middleware/';
//require($base.'mOut.php');
//require($base.'mPermissions.php');

$base= 'classes/data/';
require($base.'dCreate.php');
require($base.'dDelete.php');
require($base.'dRead.php');
require($base.'dUpdate.php');

$base= 'classes/queries/';
require($base.'qAuth.php');
require($base.'qBase.php');
require($base.'qOrg.php');
require($base.'qOther.php');
require($base.'qPost.php');
require($base.'qSocial.php');
require($base.'qTotal.php');
require($base.'qUser.php');

$base= 'classes/utility/';
require($base.'uPassword.php');
require($base.'uQuery.php');
require($base.'uResult.php');
require($base.'uUtilities.php');

?>