#!/bin/bash
cd app/tests/rest
 
cd data
phpunit dCreateTest.php
phpunit dDeleteTest.php
phpunit dReadTest.php
phpunit dUpdateTest.php

cd ../
cd objects
phpunit oAddressTest.php
phpunit oCloutTest.php
phpunit oCommentTest.php
phpunit oFollowTest.php
phpunit oOrgTest.php
phpunit oPostTest.php
phpunit oReviewTest.php
phpunit oSessionTest.php
phpunit oStatsTest.php
phpunit oThumbTest.php
phpunit oUserTest.php
phpunit oViewTest.php

cd ../
cd utility
phpunit uQueriesTest.php
phpunit uResultTest.php
phpunit uUtilitiesTest.php