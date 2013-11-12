#!/bin/bash
cd app/tests/rest
 
cd curl
phpunit address.php
phpunit clout.php
phpunit comment.php
phpunit community.php
phpunit follow.php
phpunit org.php
#phpunit post.php
phpunit review.php
phpunit session.php
#phpunit stats.php
phpunit tag.php
phpunit thumb.php
phpunit user.php
phpunit view.php